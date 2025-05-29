-- ===========================================
-- INSERCIÓN GRUPOS-NIVELES ÁREA 2 - CONVENIO 2025
-- ===========================================

USE GestioPersonal_2025;

INSERT INTO GRUP_NIVELL (codi_grup, nom_grup, area_funcional, salari_total, periode_prova, dies_vacances, categoria_professional, formació_requerida, experiència_mínima, plus_conveni) VALUES
-- GRUP A
('A2GA1', 'Grup A Nivell 1', 'Àrea 2', 22246.16, 180, 23,
 'Direcció i coordinació d\'atenció al client amb autonomia total',
 'Titulació superior + experiència en gestió', 60, 2658.32),

-- GRUP B
('A2GB1', 'Grup B Nivell 1', 'Àrea 2', 20377.72, 180, 23,
 'Supervisió i gestió d\'equips d\'atenció al client',
 'Titulació mitjana/superior + experiència supervisió', 36, 2190.62),

('A2GB2', 'Grup B Nivell 2', 'Àrea 2', 18485.91, 180, 23,
 'Coordinació d\'activitats d\'atenció al client',
 'Titulació mitjana + experiència coordinació', 24, 2135.39),

-- GRUP C
('A2GC1', 'Grup C Nivell 1', 'Àrea 2', 17346.87, 120, 23,
 'Tècnic especialista en atenció al client',
 'FP Superior o equivalent + experiència', 24, 2455.92),

('A2GC2', 'Grup C Nivell 2', 'Àrea 2', 17056.00, 120, 23,
 'Tècnic en atenció al client amb iniciativa',
 'FP Superior o equivalent', 12, 2626.76),

('A2GC3', 'Grup C Nivell 3', 'Àrea 2', 16976.00, 120, 23,
 'Tècnic junior en atenció al client',
 'FP Superior o equivalent - Entrada', 0, 2733.14),

-- GRUP D
('A2GD1', 'Grup D Nivell 1', 'Àrea 2', 16896.00, 90, 23,
 'Auxiliar experimentat d\'atenció al client',
 'Batxillerat/FP Mitjà + experiència', 12, 2605.36),

('A2GD2', 'Grup D Nivell 2', 'Àrea 2', 16816.00, 90, 23,
 'Auxiliar d\'atenció al client',
 'Batxillerat/FP Mitjà', 6, 2577.89),

('A2GD3', 'Grup D Nivell 3', 'Àrea 2', 16736.00, 90, 23,
 'Auxiliar junior d\'atenció al client',
 'ESO/Batxillerat - Entrada', 0, 2656.00),

-- GRUP E
('A2GE1', 'Grup E Nivell 1', 'Àrea 2', 16656.00, 90, 23,
 'Operador d\'atenció al client',
 'ESO o equivalent', 0, 3051.38),

('A2GE2', 'Grup E Nivell 2', 'Àrea 2', 16576.00, 90, 23,
 'Operador bàsic d\'atenció al client',
 'ESO o equivalent - Entrada', 0, 3030.09);

SELECT COUNT(*) as 'Grupos insertados' FROM GRUP_NIVELL WHERE area_funcional = 'Àrea 2';
