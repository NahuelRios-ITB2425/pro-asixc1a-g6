-- ===========================================
-- INSERCIÓN DEPARTAMENTOS Y EMPLEADOS
-- ===========================================

USE GestioPersonal_2025;

-- Insertar departamentos
INSERT INTO DEPARTAMENTO VALUES
('DEPT001', 'Atenció al Client Catalunya', '932654789', 'Barcelona', 'Maria García López', 450000.00, 0),
('DEPT002', 'Suport Tècnic Madrid', '915478963', 'Madrid', 'Carlos Rodríguez Fernández', 380000.00, 0),
('DEPT003', 'Call Center València', '963258741', 'València', 'Ana Martínez Sánchez', 320000.00, 0),
('DEPT004', 'Atenció Digital Sevilla', '954789632', 'Sevilla', 'José Luis Jiménez', 290000.00, 0),
('DEPT005', 'Customer Success Bilbao', '944123789', 'Bilbao', 'Miren Etxebarria', 340000.00, 0),
('DEPT006', 'Helpdesk Galicia', '981456123', 'A Coruña', 'Francisco Pérez Castro', 280000.00, 0);

-- Insertar empleados del área 2
INSERT INTO EMPLEADO (dni_empleado, nom, cognoms, adreça, telèfon, email, data_alta, estat, categoria, codi_departament, codi_grup, salari_brut_anual, data_naixement, sexe, nacionalitat, nss, compte_bancari) VALUES
-- DIRECTIVOS (Grup A)
('12345678A', 'Maria', 'García López', 'Carrer Major 123, Barcelona', '600123456', 'maria.garcia@empresa.com', '2020-03-15', 'Actiu', 'Directora Atenció Client', 'DEPT001', 'A2GA1', 22246.16, '1985-07-20', 'F', 'Espanyola', '123456789012', 'ES2100200300400500607A'),

('23456789B', 'Carlos', 'Rodríguez Fernández', 'Avinguda Constitució 456, Madrid', '600234567', 'carlos.rodriguez@empresa.com', '2019-09-10', 'Actiu', 'Cap Suport Tècnic', 'DEPT002', 'A2GA1', 22246.16, '1982-11-15', 'M', 'Espanyola', '234567890123', 'ES2100200300400500607B'),

-- SUPERVISORES (Grup B)
('34567890C', 'Ana', 'Martínez Sánchez', 'Plaça Espanya 789, València', '600345678', 'ana.martinez@empresa.com', '2021-01-20', 'Actiu', 'Supervisora Call Center', 'DEPT003', 'A2GB1', 20377.72, '1988-03-25', 'F', 'Espanyola', '345678901234', 'ES2100200300400500607C'),

('45678901D', 'José Luis', 'Jiménez Moreno', 'Carrer Sierpes 321, Sevilla', '600456789', 'joseluis.jimenez@empresa.com', '2021-06-01', 'Actiu', 'Coordinador Digital', 'DEPT004', 'A2GB2', 18485.91, '1990-08-10', 'M', 'Espanyola', '456789012345', 'ES2100200300400500607D'),

('56789012E', 'Miren', 'Etxebarria Aguirre', 'Kale Nagusia 654, Bilbao', '600567890', 'miren.etxebarria@empresa.com', '2022-02-14', 'Actiu', 'Responsable Customer Success', 'DEPT005', 'A2GB1', 20377.72, '1986-12-05', 'F', 'Espanyola', '567890123456', 'ES2100200300400500607E'),

-- TÉCNICOS (Grup C)
('67890123F', 'Francisco', 'Pérez Castro', 'Rúa Real 987, A Coruña', '600678901', 'francisco.perez@empresa.com', '2022-09-05', 'Actiu', 'Tècnic Helpdesk Senior', 'DEPT006', 'A2GC1', 17346.87, '1987-05-30', 'M', 'Espanyola', '678901234567', 'ES2100200300400500607F'),

('78901234G', 'Laura', 'Fernández Ruiz', 'Carrer Gran Via 147, Barcelona', '600789012', 'laura.fernandez@empresa.com', '2023-01-10', 'Actiu', 'Tècnica Atenció Client', 'DEPT001', 'A2GC2', 17056.00, '1991-09-18', 'F', 'Espanyola', '789012345678', 'ES2100200300400500607G'),

('89012345H', 'David', 'López Martínez', 'Avinguda Libertad 258, Madrid', '600890123', 'david.lopez@empresa.com', '2023-03-20', 'Actiu', 'Tècnic Junior', 'DEPT002', 'A2GC3', 16976.00, '1993-01-14', 'M', 'Espanyola', '890123456789', 'ES2100200300400500607H'),

('90123456I', 'Carmen', 'González Vila', 'Plaça Major 369, València', '600901234', 'carmen.gonzalez@empresa.com', '2023-05-15', 'Actiu', 'Tècnica Call Center', 'DEPT003', 'A2GC2', 17056.00, '1989-06-22', 'F', 'Espanyola', '901234567890', 'ES2100200300400500607I'),

-- AUXILIARES (Grup D)
('01234567J', 'Miguel', 'Sánchez Torres', 'Carrer Betis 741, Sevilla', '600012345', 'miguel.sanchez@empresa.com', '2023-08-01', 'Actiu', 'Auxiliar Atenció Digital', 'DEPT004', 'A2GD1', 16896.00, '1994-02-28', 'M', 'Espanyola', '012345678901', 'ES2100200300400500607J'),

('11234567K', 'Cristina', 'Morales Vega', 'Kalea Autonomia 852, Bilbao', '600112345', 'cristina.morales@empresa.com', '2023-10-10', 'Actiu', 'Auxiliar Customer Success', 'DEPT005', 'A2GD2', 16816.00, '1995-11-03', 'F', 'Espanyola', '112345678902', 'ES2100200300400500607K'),

('21234567L', 'Antonio', 'Ramos Iglesias', 'Rúa Nova 963, A Coruña', '600212345', 'antonio.ramos@empresa.com', '2024-01-15', 'Actiu', 'Auxiliar Helpdesk', 'DEPT006', 'A2GD3', 16736.00, '1996-04-17', 'M', 'Espanyola', '212345678903', 'ES2100200300400500607L'),

-- OPERADORES (Grup E)
('31234567M', 'Silvia', 'Herrera Núñez', 'Carrer Muntaner 159, Barcelona', '600312345', 'silvia.herrera@empresa.com', '2024-02-01', 'Actiu', 'Operadora Atenció Client', 'DEPT001', 'A2GE1', 16656.00, '1997-07-11', 'F', 'Espanyola', '312345678904', 'ES2100200300400500607M'),

('41234567N', 'Javier', 'Molina Cano', 'Avinguda Meridiana 357, Madrid', '600412345', 'javier.molina@empresa.com', '2024-03-01', 'Actiu', 'Operador Suport', 'DEPT002', 'A2GE2', 16576.00, '1998-12-23', 'M', 'Espanyola', '412345678905', 'ES2100200300400500607N'),

('51234567O', 'Raquel', 'Blanco Serrano', 'Carrer Colón 468, València', '600512345', 'raquel.blanco@empresa.com', '2024-04-01', 'Actiu', 'Operadora Call Center', 'DEPT003', 'A2GE1', 16656.00, '1999-05-08', 'F', 'Espanyola', '512345678906', 'ES2100200300400500607O'),

('61234567P', 'Fernando', 'Castro Delgado', 'Carrer Imagen 579, Sevilla', '600612345', 'fernando.castro@empresa.com', '2024-05-01', 'Actiu', 'Operador Digital Bàsic', 'DEPT004', 'A2GE2', 16576.00, '2000-09-19', 'M', 'Espanyola', '612345678907', 'ES2100200300400500607P');

-- Actualizar contador empleados por departamento
UPDATE DEPARTAMENTO d 
SET num_empleats = (
    SELECT COUNT(*) 
    FROM EMPLEADO e 
    WHERE e.codi_departament = d.codi_departament 
    AND e.estat = 'Actiu'
);

SELECT 'Datos insertados correctamente' as estado;
SELECT COUNT(*) as 'Total empleados' FROM EMPLEADO;
SELECT codi_departament, COUNT(*) as empleados FROM EMPLEADO GROUP BY codi_departament;
