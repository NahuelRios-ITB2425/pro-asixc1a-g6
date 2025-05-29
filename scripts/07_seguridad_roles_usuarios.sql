-- ===========================================
-- CREACIÓN DE ROLES Y USUARIOS DE SEGURIDAD
-- ===========================================

USE GestioPersonal_2025;

-- Eliminar usuarios existentes si los hay (para empezar limpio)
DROP USER IF EXISTS 'rrhh_manager'@'localhost';
DROP USER IF EXISTS 'rrhh_analyst'@'localhost';
DROP USER IF EXISTS 'rrhh_readonly'@'localhost';
DROP USER IF EXISTS 'dept_supervisor'@'localhost';
DROP USER IF EXISTS 'auditor_bd'@'localhost';
DROP USER IF EXISTS 'backup_user'@'localhost';
DROP USER IF EXISTS 'app_user'@'localhost';

-- Eliminar roles si existen
DROP ROLE IF EXISTS 'role_full_manager';
DROP ROLE IF EXISTS 'role_analyst';
DROP ROLE IF EXISTS 'role_readonly';
DROP ROLE IF EXISTS 'role_supervisor';
DROP ROLE IF EXISTS 'role_auditor';
DROP ROLE IF EXISTS 'role_backup';
DROP ROLE IF EXISTS 'role_application';

-- ===========================================
-- CREACIÓN DE ROLES CON PERMISOS ESPECÍFICOS
-- ===========================================

-- 1. ROL MANAGER COMPLETO (Solo para Director RRHH)
CREATE ROLE 'role_full_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON GestioPersonal_2025.EMPLEADO TO 'role_full_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON GestioPersonal_2025.DEPARTAMENTO TO 'role_full_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON GestioPersonal_2025.GRUP_NIVELL TO 'role_full_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON GestioPersonal_2025.HISTORIAL_CATEGORIA TO 'role_full_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON GestioPersonal_2025.VACANCES TO 'role_full_manager';
GRANT SELECT, INSERT, UPDATE, DELETE ON GestioPersonal_2025.NOMINES TO 'role_full_manager';
GRANT SELECT ON GestioPersonal_2025.v_empleats_complet TO 'role_full_manager';
GRANT SELECT ON GestioPersonal_2025.v_departaments_estadistiques TO 'role_full_manager';
GRANT EXECUTE ON PROCEDURE GestioPersonal_2025.sp_promocionar_empleat TO 'role_full_manager';

-- 2. ROL ANALISTA (Para analistas de RRHH)
CREATE ROLE 'role_analyst';
GRANT SELECT, INSERT, UPDATE ON GestioPersonal_2025.EMPLEADO TO 'role_analyst';
GRANT SELECT ON GestioPersonal_2025.DEPARTAMENTO TO 'role_analyst';
GRANT SELECT ON GestioPersonal_2025.GRUP_NIVELL TO 'role_analyst';
GRANT SELECT, INSERT ON GestioPersonal_2025.HISTORIAL_CATEGORIA TO 'role_analyst';
GRANT SELECT, INSERT, UPDATE ON GestioPersonal_2025.VACANCES TO 'role_analyst';
GRANT SELECT ON GestioPersonal_2025.NOMINES TO 'role_analyst';
GRANT SELECT ON GestioPersonal_2025.v_empleats_complet TO 'role_analyst';
GRANT SELECT ON GestioPersonal_2025.v_departaments_estadistiques TO 'role_analyst';
GRANT EXECUTE ON PROCEDURE GestioPersonal_2025.sp_promocionar_empleat TO 'role_analyst';

-- 3. ROL SOLO LECTURA (Para consultores externos, becarios)
CREATE ROLE 'role_readonly';
GRANT SELECT ON GestioPersonal_2025.EMPLEADO TO 'role_readonly';
GRANT SELECT ON GestioPersonal_2025.DEPARTAMENTO TO 'role_readonly';
GRANT SELECT ON GestioPersonal_2025.GRUP_NIVELL TO 'role_readonly';
GRANT SELECT ON GestioPersonal_2025.v_empleats_complet TO 'role_readonly';
-- NO acceso a nóminas ni datos sensibles

-- 4. ROL SUPERVISOR DEPARTAMENTO (Para jefes de departamento)
CREATE ROLE 'role_supervisor';
GRANT SELECT ON GestioPersonal_2025.EMPLEADO TO 'role_supervisor';
GRANT SELECT ON GestioPersonal_2025.DEPARTAMENTO TO 'role_supervisor';
GRANT SELECT ON GestioPersonal_2025.GRUP_NIVELL TO 'role_supervisor';
GRANT SELECT, INSERT, UPDATE ON GestioPersonal_2025.VACANCES TO 'role_supervisor';
GRANT SELECT ON GestioPersonal_2025.v_empleats_complet TO 'role_supervisor';
-- Solo puede gestionar vacaciones, no salarios

-- 5. ROL AUDITOR (Para auditorías internas/externas)
CREATE ROLE 'role_auditor';
GRANT SELECT ON GestioPersonal_2025.* TO 'role_auditor';
GRANT SELECT ON mysql.general_log TO 'role_auditor';
GRANT SELECT ON mysql.slow_log TO 'role_auditor';
-- Solo lectura para auditoría completa

-- 6. ROL BACKUP (Para procesos de backup automatizados)
CREATE ROLE 'role_backup';
GRANT SELECT, LOCK TABLES ON GestioPersonal_2025.* TO 'role_backup';
GRANT RELOAD ON *.* TO 'role_backup';

-- 7. ROL APLICACIÓN (Para aplicaciones web/mobile)
CREATE ROLE 'role_application';
GRANT SELECT, INSERT, UPDATE ON GestioPersonal_2025.EMPLEADO TO 'role_application';
GRANT SELECT ON GestioPersonal_2025.DEPARTAMENTO TO 'role_application';
GRANT SELECT ON GestioPersonal_2025.GRUP_NIVELL TO 'role_application';
GRANT SELECT, INSERT, UPDATE ON GestioPersonal_2025.VACANCES TO 'role_application';
GRANT SELECT ON GestioPersonal_2025.v_empleats_complet TO 'role_application';
-- Permisos limitados para aplicaciones

-- ===========================================
-- CREACIÓN DE USUARIOS CON CONTRASEÑAS SEGURAS
-- ===========================================

-- 1. Usuario Manager (Director RRHH)
CREATE USER 'rrhh_manager'@'localhost' IDENTIFIED BY 'Manager2025#SecuRe!';
GRANT 'role_full_manager' TO 'rrhh_manager'@'localhost';
SET DEFAULT ROLE 'role_full_manager' TO 'rrhh_manager'@'localhost';

-- 2. Usuario Analista
CREATE USER 'rrhh_analyst'@'localhost' IDENTIFIED BY 'Analyst2025#Data$';
GRANT 'role_analyst' TO 'rrhh_analyst'@'localhost';
SET DEFAULT ROLE 'role_analyst' TO 'rrhh_analyst'@'localhost';

-- 3. Usuario Solo Lectura
CREATE USER 'rrhh_readonly'@'localhost' IDENTIFIED BY 'ReadOnly2025#View$';
GRANT 'role_readonly' TO 'rrhh_readonly'@'localhost';
SET DEFAULT ROLE 'role_readonly' TO 'rrhh_readonly'@'localhost';

-- 4. Usuario Supervisor Departamento
CREATE USER 'dept_supervisor'@'localhost' IDENTIFIED BY 'Supervisor2025#Dept!';
GRANT 'role_supervisor' TO 'dept_supervisor'@'localhost';
SET DEFAULT ROLE 'role_supervisor' TO 'dept_supervisor'@'localhost';

-- 5. Usuario Auditor
CREATE USER 'auditor_bd'@'localhost' IDENTIFIED BY 'Auditor2025#Check$';
GRANT 'role_auditor' TO 'auditor_bd'@'localhost';
SET DEFAULT ROLE 'role_auditor' TO 'auditor_bd'@'localhost';

-- 6. Usuario Backup
CREATE USER 'backup_user'@'localhost' IDENTIFIED BY 'Backup2025#Secure!';
GRANT 'role_backup' TO 'backup_user'@'localhost';
SET DEFAULT ROLE 'role_backup' TO 'backup_user'@'localhost';

-- 7. Usuario Aplicación
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'AppUser2025#Connect$';
GRANT 'role_application' TO 'app_user'@'localhost';
SET DEFAULT ROLE 'role_application' TO 'app_user'@'localhost';

-- ===========================================
-- CONFIGURACIONES ADICIONALES DE SEGURIDAD
-- ===========================================

-- Limitar recursos por usuario
ALTER USER 'rrhh_readonly'@'localhost' WITH MAX_QUERIES_PER_HOUR 1000;
ALTER USER 'dept_supervisor'@'localhost' WITH MAX_QUERIES_PER_HOUR 2000;
ALTER USER 'app_user'@'localhost' WITH MAX_QUERIES_PER_HOUR 5000;

-- Configurar expiración de contraseñas
ALTER USER 'rrhh_manager'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
ALTER USER 'rrhh_analyst'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
ALTER USER 'rrhh_readonly'@'localhost' PASSWORD EXPIRE INTERVAL 180 DAY;
ALTER USER 'dept_supervisor'@'localhost' PASSWORD EXPIRE INTERVAL 120 DAY;
ALTER USER 'auditor_bd'@'localhost' PASSWORD EXPIRE INTERVAL 60 DAY;

-- Aplicar cambios
FLUSH PRIVILEGES;

-- ===========================================
-- VERIFICACIONES DE SEGURIDAD
-- ===========================================

-- Mostrar usuarios creados
SELECT 'USUARIOS CREADOS:' as info;
SELECT User, Host, account_locked, password_expired FROM mysql.user 
WHERE User IN ('rrhh_manager', 'rrhh_analyst', 'rrhh_readonly', 'dept_supervisor', 'auditor_bd', 'backup_user', 'app_user');

-- Mostrar roles creados
SELECT 'ROLES ASIGNADOS:' as info;
SELECT * FROM mysql.role_edges;

SELECT 'Roles y usuarios de seguridad creados correctamente' as estado;
