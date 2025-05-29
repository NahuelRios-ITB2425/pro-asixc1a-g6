


# Servei d’Auditoria

Per garantir un control eficaç de l’activitat dels nostres sistemes, hem implementat un **servei d’auditoria centralitzat** amb **Auditbeat**. Aquesta solució ens permet **monitorar esdeveniments en temps real** i **reforçar la seguretat** de la nostra infraestructura.

Disposem d’un **servidor d’auditoria dedicat**, on tenim instal·lats els següents components:

- **Elasticsearch**: per indexar i emmagatzemar les dades.
- **Kibana**: per visualitzar informes des d’una interfície gràfica.
- **Auditbeat**: per recollir i enviar esdeveniments.

Als **servidors auditats**, només s’instal·la **Auditbeat** amb una configuració que els permet **enviar dades al servidor central**.

Aquest sistema ens permet **centralitzar tota la informació d’auditoria**, facilitant-ne **l’anàlisi**, la **detecció d’anomalies** i la **gestió dels registres** en un únic lloc.

