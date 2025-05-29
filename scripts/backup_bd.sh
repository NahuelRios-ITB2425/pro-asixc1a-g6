#!/bin/bash

# Script de backup de la base de datos
FECHA=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/home/ubuntu/backups_bd"
DB_NAME="GestioPersonal_2025"
DB_USER="admin_bd"

# Crear directorio si no existe
mkdir -p $BACKUP_DIR

# Realizar backup
mysqldump -u $DB_USER -p $DB_NAME > $BACKUP_DIR/backup_${DB_NAME}_${FECHA}.sql

echo "Backup completado: $BACKUP_DIR/backup_${DB_NAME}_${FECHA}.sql"
