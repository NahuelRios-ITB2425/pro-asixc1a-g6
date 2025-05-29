-- ===========================================
-- SISTEMA DE AUDITORÍA Y MONITOREO
-- ===========================================

USE GestioPersonal_2025;

-- Tabla de auditoría para cambios críticos
CREATE TABLE AUDITORIA_SEGURIDAD (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    accion ENUM('INSERT','UPDATE','DELETE','LOGIN','LOGOUT','FAILED_LOGIN') NOT NULL,
    tabla_afectada VARCHAR(50),
    campo_modificado VARCHAR(50),
    valor_anterior TEXT,
    valor_nuevo TEXT,
    ip_origen VARCHAR(45),
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalles TEXT,
    
    INDEX idx_usuario_fecha (usuario, fecha_hora),
    INDEX idx_accion_fecha (accion, fecha_hora),
    INDEX idx_tabla_fecha (tabla_afectada, fecha_hora)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para intentos de acceso sospechosos
CREATE TABLE INTENTOS_ACCESO_SOSPECHOSOS (
    id_intento INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    ip_origen VARCHAR(45),
    tipo_evento ENUM('FAILED_LOGIN','PRIVILEGE_ESCALATION','UNUSUAL_QUERY','MASS_DATA_ACCESS') NOT NULL,
    descripcion TEXT,
    consulta_ejecutada TEXT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    bloqueado BOOLEAN DEFAULT FALSE,
    
    INDEX idx_usuario_fecha (usuario, fecha_hora),
    INDEX idx_ip_fecha (ip_origen, fecha_hora),
    INDEX idx_tipo_fecha (tipo_evento, fecha_hora)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER //

-- Procedimiento para registrar auditoría
CREATE PROCEDURE sp_registrar_auditoria(
    IN p_usuario VARCHAR(50),
    IN p_accion ENUM('INSERT','UPDATE','DELETE','LOGIN','LOGOUT','FAILED_LOGIN'),
    IN p_tabla VARCHAR(50),
    IN p_campo VARCHAR(50),
    IN p_valor_anterior TEXT,
    IN p_valor_nuevo TEXT,
    IN p_detalles TEXT
)
BEGIN
    INSERT INTO AUDITORIA_SEGURIDAD (
        usuario, accion, tabla_afectada, campo_modificado, 
        valor_anterior, valor_nuevo, ip_origen, detalles
    ) VALUES (
        p_usuario, p_accion, p_tabla, p_campo, 
        p_valor_anterior, p_valor_nuevo, 
        CONNECTION_ID(), p_detalles
    );
END //

-- Procedimiento para detectar actividad sospechosa
CREATE PROCEDURE sp_detectar_actividad_sospechosa()
BEGIN
    -- Detectar múltiples fallos de login
    INSERT INTO INTENTOS_ACCESO_SOSPECHOSOS (usuario, tipo_evento, descripcion)
    SELECT 
        usuario,
        'FAILED_LOGIN' as tipo_evento,
        CONCAT('Múltiples intentos fallidos de login: ', COUNT(*), ' intentos en la última hora') as descripcion
    FROM AUDITORIA_SEGURIDAD 
    WHERE accion = 'FAILED_LOGIN' 
    AND fecha_hora >= DATE_SUB(NOW(), INTERVAL 1 HOUR)
    GROUP BY usuario
    HAVING COUNT(*) >= 5;
    
    SELECT 'Detección de actividad sospechosa completada' as resultado;
END //

-- Función para verificar permisos de usuario
CREATE FUNCTION f_verificar_permisos_usuario(p_usuario VARCHAR(50), p_tabla VARCHAR(50))
RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE v_tiene_permisos BOOLEAN DEFAULT FALSE;
    
    SELECT COUNT(*) > 0 INTO v_tiene_permisos
    FROM information_schema.TABLE_PRIVILEGES tp
    WHERE tp.GRANTEE LIKE CONCAT('%', p_usuario, '%')
    AND tp.TABLE_SCHEMA = 'GestioPersonal_2025'
    AND tp.TABLE_NAME = p_tabla
    AND tp.PRIVILEGE_TYPE IN ('SELECT', 'INSERT', 'UPDATE', 'DELETE');
    
    RETURN v_tiene_permisos;
END //

DELIMITER ;

-- ===========================================
-- TRIGGERS DE AUDITORÍA AUTOMÁTICA
-- ===========================================

DELIMITER //

-- Trigger para auditar cambios en empleados
CREATE TRIGGER tr_auditoria_empleado_update
    AFTER UPDATE ON EMPLEADO
    FOR EACH ROW
BEGIN
    -- Auditar cambio de salario
    IF OLD.salari_brut_anual != NEW.salari_brut_anual THEN
        CALL sp_registrar_auditoria(
            USER(), 'UPDATE', 'EMPLEADO', 'salari_brut_anual',
            OLD.salari_brut_anual, NEW.salari_brut_anual,
            CONCAT('Cambio salario empleado: ', NEW.dni_empleado)
        );
    END IF;
    
    -- Auditar cambio de grupo
    IF OLD.codi_grup != NEW.codi_grup THEN
        CALL sp_registrar_auditoria(
            USER(), 'UPDATE', 'EMPLEADO', 'codi_grup',
            OLD.codi_grup, NEW.codi_grup,
            CONCAT('Cambio grupo empleado: ', NEW.dni_empleado)
        );
    END IF;
    
    -- Auditar cambio de estado
    IF OLD.estat != NEW.estat THEN
        CALL sp_registrar_auditoria(
            USER(), 'UPDATE', 'EMPLEADO', 'estat',
            OLD.estat, NEW.estat,
            CONCAT('Cambio estado empleado: ', NEW.dni_empleado)
        );
    END IF;
END //

-- Trigger para auditar inserciones de empleados
CREATE TRIGGER tr_auditoria_empleado_insert
    AFTER INSERT ON EMPLEADO
    FOR EACH ROW
BEGIN
    CALL sp_registrar_auditoria(
        USER(), 'INSERT', 'EMPLEADO', 'dni_empleado',
        NULL, NEW.dni_empleado,
        CONCAT('Nuevo empleado creado: ', NEW.nom, ' ', NEW.cognoms)
    );
END //

-- Trigger para auditar eliminaciones (si las hay)
CREATE TRIGGER tr_auditoria_empleado_delete
    AFTER DELETE ON EMPLEADO
    FOR EACH ROW
BEGIN
    CALL sp_registrar_auditoria(
        USER(), 'DELETE', 'EMPLEADO', 'dni_empleado',
        OLD.dni_empleado, NULL,
        CONCAT('Empleado eliminado: ', OLD.nom, ' ', OLD.cognoms)
    );
END //

DELIMITER ;

-- Vista para monitoreo de seguridad
CREATE VIEW v_monitoreo_seguridad AS
SELECT 
    DATE(fecha_hora) as fecha,
    usuario,
    accion,
    COUNT(*) as num_acciones,
    GROUP_CONCAT(DISTINCT tabla_afectada) as tablas_afectadas
FROM AUDITORIA_SEGURIDAD
WHERE fecha_hora >= DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY DATE(fecha_hora), usuario, accion
ORDER BY fecha DESC, num_acciones DESC;

-- Vista de alertas de seguridad
CREATE VIEW v_alertas_seguridad AS
SELECT 
    usuario,
    tipo_evento,
    COUNT(*) as num_eventos,
    MAX(fecha_hora) as ultimo_evento,
    SUM(CASE WHEN bloqueado THEN 1 ELSE 0 END) as eventos_bloqueados
FROM INTENTOS_ACCESO_SOSPECHOSOS
WHERE fecha_hora >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
GROUP BY usuario, tipo_evento
ORDER BY num_eventos DESC;

SELECT 'Sistema de auditoría implementado correctamente' as estado;
