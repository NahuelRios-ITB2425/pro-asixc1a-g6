-- ===========================================
-- CREACIÓN DE TABLAS - ORDEN IMPORTANTE POR FK
-- ===========================================

USE GestioPersonal_2025;

-- Taula DEPARTAMENTO (sense FK)
CREATE TABLE DEPARTAMENTO (
    codi_departament VARCHAR(10) NOT NULL,
    nom_departament VARCHAR(100) NOT NULL,
    telèfon_dept VARCHAR(15),
    ubicació VARCHAR(100),
    responsable VARCHAR(100),
    pressupost DECIMAL(12,2) DEFAULT 0.00,
    num_empleats INT DEFAULT 0,
    data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT PK_departamento PRIMARY KEY (codi_departament),
    CONSTRAINT CHK_pressupost CHECK (pressupost >= 0),
    CONSTRAINT CHK_num_empleats CHECK (num_empleats >= 0)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Taula GRUP_NIVELL (sense FK)
CREATE TABLE GRUP_NIVELL (
    codi_grup VARCHAR(10) NOT NULL,
    nom_grup VARCHAR(50) NOT NULL,
    area_funcional ENUM('Àrea 1','Àrea 2','Àrea 3','Àrea 4','Àrea 5','Àrea 6') NOT NULL,
    salari_total DECIMAL(10,2) NOT NULL,
    periode_prova INT NOT NULL,
    dies_vacances INT NOT NULL DEFAULT 23,
    categoria_professional VARCHAR(100),
    formació_requerida TEXT,
    experiència_mínima INT DEFAULT 0,
    plus_conveni DECIMAL(8,2) NOT NULL,
    vigencia_inici DATE NOT NULL DEFAULT '2025-01-01',
    vigencia_fi DATE,
    data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT PK_grup_nivell PRIMARY KEY (codi_grup),
    CONSTRAINT CHK_salari CHECK (salari_total > 0),
    CONSTRAINT CHK_periode_prova CHECK (periode_prova > 0),
    CONSTRAINT CHK_vacances CHECK (dies_vacances >= 22 AND dies_vacances <= 30),
    CONSTRAINT CHK_experiència CHECK (experiència_mínima >= 0)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Taula EMPLEADO (amb FK)
CREATE TABLE EMPLEADO (
    dni_empleado VARCHAR(10) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    adreça TEXT,
    telèfon VARCHAR(15),
    email VARCHAR(100),
    data_alta DATE NOT NULL DEFAULT (CURRENT_DATE),
    estat ENUM('Actiu','Inactiu','Baixa','Excedència') NOT NULL DEFAULT 'Actiu',
    categoria VARCHAR(50),
    codi_departament VARCHAR(10) NOT NULL,
    codi_grup VARCHAR(10) NOT NULL,
    salari_brut_anual DECIMAL(10,2),
    data_naixement DATE,
    sexe ENUM('M','F','Altre'),
    nacionalitat VARCHAR(50) DEFAULT 'Espanyola',
    nss VARCHAR(15),
    compte_bancari VARCHAR(34),
    data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_empleado PRIMARY KEY (dni_empleado),
    CONSTRAINT FK_empleado_departamento FOREIGN KEY (codi_departament) 
        REFERENCES DEPARTAMENTO(codi_departament) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT FK_empleado_grup FOREIGN KEY (codi_grup) 
        REFERENCES GRUP_NIVELL(codi_grup) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT CHK_email CHECK (email LIKE '%@%.%'),
    CONSTRAINT CHK_dni CHECK (CHAR_LENGTH(dni_empleado) = 9),
    CONSTRAINT CHK_data_alta CHECK (data_alta >= '2000-01-01'),
    CONSTRAINT CHK_salari_positiu CHECK (salari_brut_anual > 0)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===========================================
-- TAULES AUXILIARS PER FUNCIONALITAT EXTRA
-- ===========================================

-- Historial de canvis de categoria
CREATE TABLE HISTORIAL_CATEGORIA (
    id_historial INT AUTO_INCREMENT,
    dni_empleado VARCHAR(10) NOT NULL,
    codi_grup_anterior VARCHAR(10),
    codi_grup_nou VARCHAR(10) NOT NULL,
    data_canvi DATE NOT NULL,
    motiu TEXT,
    aprovat_per VARCHAR(100),
    
    CONSTRAINT PK_historial PRIMARY KEY (id_historial),
    CONSTRAINT FK_historial_empleado FOREIGN KEY (dni_empleado) 
        REFERENCES EMPLEADO(dni_empleado) ON DELETE CASCADE,
    CONSTRAINT FK_historial_grup_ant FOREIGN KEY (codi_grup_anterior) 
        REFERENCES GRUP_NIVELL(codi_grup),
    CONSTRAINT FK_historial_grup_nou FOREIGN KEY (codi_grup_nou) 
        REFERENCES GRUP_NIVELL(codi_grup)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Taula de vacances
CREATE TABLE VACANCES (
    id_vacances INT AUTO_INCREMENT,
    dni_empleado VARCHAR(10) NOT NULL,
    data_inici DATE NOT NULL,
    data_fi DATE NOT NULL,
    dies_solicitats INT NOT NULL,
    estat_solicitud ENUM('Pendent','Aprovada','Rebutjada') DEFAULT 'Pendent',
    any_corresponent YEAR NOT NULL,
    comentaris TEXT,
    data_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_vacances PRIMARY KEY (id_vacances),
    CONSTRAINT FK_vacances_empleado FOREIGN KEY (dni_empleado) 
        REFERENCES EMPLEADO(dni_empleado) ON DELETE CASCADE,
    CONSTRAINT CHK_dates_vacances CHECK (data_fi >= data_inici),
    CONSTRAINT CHK_dies_positius CHECK (dies_solicitats > 0)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Taula de nòmines
CREATE TABLE NOMINES (
    id_nomina INT AUTO_INCREMENT,
    dni_empleado VARCHAR(10) NOT NULL,
    mes TINYINT NOT NULL,
    any YEAR NOT NULL,
    salari_base DECIMAL(8,2) NOT NULL,
    plus_conveni DECIMAL(6,2) NOT NULL,
    plus_antiguitat DECIMAL(6,2) DEFAULT 0,
    hores_extra DECIMAL(5,2) DEFAULT 0,
    imports_extra DECIMAL(7,2) DEFAULT 0,
    deduccions DECIMAL(7,2) DEFAULT 0,
    salari_net DECIMAL(8,2) NOT NULL,
    data_generacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT PK_nomines PRIMARY KEY (id_nomina),
    CONSTRAINT FK_nomines_empleado FOREIGN KEY (dni_empleado) 
        REFERENCES EMPLEADO(dni_empleado) ON DELETE CASCADE,
    CONSTRAINT UQ_nomina_mes_any UNIQUE (dni_empleado, mes, any),
    CONSTRAINT CHK_mes CHECK (mes BETWEEN 1 AND 12),
    CONSTRAINT CHK_any CHECK (any >= 2020),
    CONSTRAINT CHK_salaris_positius CHECK (salari_base > 0 AND salari_net > 0)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT 'Tablas creadas correctamente' as estado;
