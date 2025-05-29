-- ===========================================
-- CREACIÓN BASE DE DATOS - GESTIÓN PERSONAL 2025
-- ===========================================

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS GestioPersonal_2025;
USE GestioPersonal_2025;

-- Configurar charset
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO';

SELECT 'Base de datos creada correctamente' as estado;
