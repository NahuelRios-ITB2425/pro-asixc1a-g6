-- ===========================================
-- CONSULTAS DE ANÁLISIS EMPRESARIAL
-- ===========================================

USE GestioPersonal_2025;

-- 1. Análisis por grupos y salarios
SELECT 
    'ANÁLISIS POR GRUPOS Y SALARIOS' as titulo;

SELECT 
    gn.area_funcional,
    gn.nom_grup,
    COUNT(e.dni_empleado) as num_empleats,
    AVG(gn.salari_total) as salari_mitjà,
    MIN(gn.salari_total) as salari_mínim,
    MAX(gn.salari_total) as salari_màxim
FROM GRUP_NIVELL gn
LEFT JOIN EMPLEADO e ON gn.codi_grup = e.codi_grup
WHERE gn.area_funcional = 'Àrea 2'
GROUP BY gn.area_funcional, gn.nom_grup
ORDER BY AVG(gn.salari_total) DESC;

-- 2. Análisis por departamento  
SELECT 
    'ANÁLISIS POR DEPARTAMENTO' as titulo;

SELECT 
    d.nom_departament,
    d.ubicació,
    COUNT(e.dni_empleado) as empleats_reals,
    d.num_empleats as empleats_registrats,
    AVG(gn.salari_total) as salari_mitjà_dept,
    SUM(gn.salari_total) as cost_salarial_total,
    d.pressupost,
    ROUND((SUM(gn.salari_total) / d.pressupost) * 100, 2) as percentatge_pressupost
FROM DEPARTAMENTO d
LEFT JOIN EMPLEADO e ON d.codi_departament = e.codi_departament
LEFT JOIN GRUP_NIVELL gn ON e.codi_grup = gn.codi_grup
GROUP BY d.codi_departament
ORDER BY cost_salarial_total DESC;

-- 3. Empleados con antigüedad
SELECT 
    'EMPLEADOS CON ANTIGÜEDAD' as titulo;

SELECT 
    e.dni_empleado,
    CONCAT(e.nom, ' ', e.cognoms) as nom_complet,
    e.data_alta,
    DATEDIFF(CURDATE(), e.data_alta) as dies_empresa,
    ROUND(DATEDIFF(CURDATE(), e.data_alta) / 365.25, 1) as anys_empresa,
    gn.nom_grup as grup_actual,
    gn.salari_total as salari_actual,
    CASE 
        WHEN DATEDIFF(CURDATE(), e.data_alta) > 1095 THEN 'Candidat per promoció'
        WHEN DATEDIFF(CURDATE(), e.data_alta) > 730 THEN 'Revisió en 1 any'
        ELSE 'Recent incorporació'
    END as estat_promoció
FROM EMPLEADO e
JOIN GRUP_NIVELL gn ON e.codi_grup = gn.codi_grup
WHERE e.estat = 'Actiu'
ORDER BY dies_empresa DESC;
