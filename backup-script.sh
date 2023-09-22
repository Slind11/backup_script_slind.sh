#!/bin/bash

#########################################################################################################
	#      Данный скрипт предназначен для создания резервной копии указанной пользователем директории       #  
# архивации файлов и удаления старых резервных копий в соответствии с установленными правилами хранения #
#########################################################################################################


echo "Введите путь директории откуда будут сделаны бэкапы: "
read Backup_directory 

echo "Директория откуда будут делаться бэкапы установлена:  $Backup_directory"

echo "Введите директорию куда будут делаться бэкапы: "
read Backup_save

#Проверерка на то есть ли это директория

if [ ! -d "$Backup_save" ]; then
   echo "Указанная директория отстутсвует, переходим к созданию"
   mkdir -p "$Backup_save"

echo "Директория $Backup_save была создана"

else

echo  "Директория $Backup_save уже существует"

fi
 
#Проверка наличия архиватора tar

if ! which tar &> /dev/null; then
    echo "Архиватор не установлен, требуется установка"
    exit 1
fi

echo "Архиватор tar установлен."

#Создание функции, которая создает имя файла для резервного копирования, с учетом переданной директории

generate_backup_filename() {
    local Backup_directory="$1"
    local Current_data=$(date +"%Y%m%d_%H%M%S")
    echo "Backup_${Current_data}_$(basename "$Backup_directory").tar.gz"
}

Backup_filename=$(generate_backup_filename "$Backup_directory")

tar -czf "$Backup_save/$Backup_filename" -C "$Backup_directory" .

echo "Бэкап успешно завешен в: $Backup_save с именем $Backup_filename"


