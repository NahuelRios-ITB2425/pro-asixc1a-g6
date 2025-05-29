-- ===========================================
-- VISTAS Y PROCEDIMIENTOS AVANZADOS
-- ===========================================

USE GestioPersonal_2025;

-- Vista empleados completa
CREATE VIEW v_empleats_complet AS
SELECT 
    e.dni_empleado,
    CONCAT(e.nom, ' ', e.cognoms) as nom_complet,
    e.email,
    e.telèfon,
    e.data_alta,
    ROUND(DATEDIFF(CURDATE(), e.data_alta) / 365.25, 1) as anys_empresa,
    e.estat,
    d.nom_departament,
    d.ubicació as ubicació_dept,
    gn.nom_grup,
    gn.area_funcional,
    gn.salari_total,
    gn.plus_conveni,
    gn.periode_prova,
    gn.dies_vacances,
    gn.categoria_professional
FROM EMPLEADO e
JOIN DEPARTAMENTO d ON e.codi_departament = d.codi_departament  
JOIN GRUP_NIVELL gn ON e.codi_grup = gn.codi_grup;

-- Vista estadísticas departamentos
CREATE VIEW v_departaments_estadistiques AS  
SELECT 
    d.codi_departament,
    d.nom_departament,
    d.ubicació,
    d.responsable,
    d.pressupost,
    COUNT(e.dni_empleado) as empleats_actius,
    AVG(gn.salari_total) as salari_mitjà,
    SUM(gn.salari_total) as cost_salarial_anual,
    ROUND((SUM(gn.salari_total) / d.pressupost) * 100, 2) as percentatge_pressupost_utilitzat
FROM DEPARTAMENTO d
LEFT JOIN EMPLEADO e ON d.codi_departament = e.codi_departament AND e.estat = 'Actiu'
LEFT JOIN GRUP_NIVELL gn ON e.codi_grup = gn.codi_grup
GROUP BY d.codi_departament;

DELIMITER //

-- Procedimiento para promocionar empleado
CREATE PROCEDURE sp_promocionar_empleat(
    IN p_dni VARCHAR(10),
    IN p_nou_grup VARCHAR(10),
    IN p_motiu TEXT,
    IN p_aprovat_per VARCHAR(100)
)
BEGIN
    DECLARE v_grup_anterior VARCHAR(10);
    DECLARE v_error VARCHAR(255) DEFAULT '';
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- Verificar empleado existe
    IF NOT EXISTS (SELECT 1 FROM EMPLEADO WHERE dni_empleado = p_dni) THEN
        SET v_error = 'Empleado no encontrado';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error;
    END IF;
    
    -- Obtener grupo anterior
    SELECT codi_grup INTO v_grup_anterior 
    FROM EMPLEADO WHERE dni_empleado = p_dni;
    
    -- Actualizar empleado
    UPDATE EMPLEADO 
    SET codi_grup = p_nou_grup,
        salari_brut_anual = (SELECT salari_total FROM GRUP_NIVELL WHERE codi_grup = p_nou_grup)
    WHERE dni_empleado = p_dni;
    
    -- Insertar historial
    INSERT INTO HISTORIAL_CATEGORIA (dni_empleado, codi_grup_anterior, codi_grup_nou, data_canvi, motiu, aprovat_per)
    VALUES (p_dni, v_grup_anterior, p_nou_grup, CURDATE(), p_motiu, p_aprovat_per);
    
    COMMIT;
    
    SELECT 'Promoción realizada correctamente' as mensaje;
END //

DELIMITER ;

SELECT 'Vistas y procedimientos creados' as estado;
