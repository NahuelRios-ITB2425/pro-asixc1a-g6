# Creació de la BBDD amb MySQL

Per a la gestió integral de la nostra base de dades, s'han desenvolupat diversos fitxers SQL i scripts de sistema, cadascun amb una finalitat específica dins del cicle de vida del sistema de gestió de dades. A continuació es detalla la funcionalitat de cadascun:

01_crear_bd.sql
Aquest script conté les instruccions per a la creació inicial de la base de dades. S'hi defineix el nom de la base de dades, la codificació de caràcters (UTF8MB4) i la col·lació corresponent per assegurar compatibilitat i integritat multilingüe.

02_crear_tablas.sql
En aquest fitxer s'estableix tota l'estructura de la base de dades, incloent-hi la definició de totes les taules, claus primàries, claus foranes, tipus de dades i restriccions necessàries per garantir la coherència relacional.

03_insertar_grupos.sql
Aquest script s'encarrega d'inserir les dades relatives als grups definits pel conveni col·lectiu corresponent a l'any 2025. Inclou tota la informació normativa i de classificació vinculada al sistema de recursos humans.

04_insertar_datos.sql
Aquí es realitza la inserció inicial de dades operatives, incloent-hi els registres dels empleats, la seva assignació a departaments, així com informació complementària necessària per al funcionament del sistema.

05_vistas_procedimientos.sql
Aquest arxiu conté la implementació de funcionalitats avançades mitjançant la creació de vistes i procediments emmagatzemats. Les vistes permeten abstraure consultes complexes, i els procediments automatitzen operacions recurrents o crítiques.

06_consultas_analisis.sql
En aquest script es defineixen consultes analítiques destinades a l'explotació de dades, com ara informes estadístics, resum d'indicadors i extracció d'informació rellevant per a la presa de decisions.

backup_bd.sh
Es tracta d'un script de shell preparat per a realitzar còpies de seguretat automàtiques de la base de dades. Aquest mecanisme de backup incrementa la seguretat i garanteix la recuperació de la informació en cas d'incidència o pèrdua de dades.

Conclusió
Amb aquesta estructura modular de scripts, s’assegura una gestió ordenada, segura i escalable de la base de dades. Tots els processos, des de la creació inicial fins a l’anàlisi avançada i la protecció de dades, estan coberts de manera eficient.
