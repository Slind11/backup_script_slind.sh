#!/bin/bash

#########################################################################################################
#      Данный скрипт предназначен для создания резервной копии указанной пользователем директории       #  
# архивации файлов и удаления старых резервных копий в соответствии с установленными правилами хранения #
#########################################################################################################


echo "Введите путь до директории для резервного копирования: "
read your_directory 

echo "Вы ввели:  $your_directory"

#Проверка наличия tar

if ! which tar &> /dev/null; then
    echo "Архиватор не установлен, требуется установка"
    exit 1
fi

echo "Архиватор tar установлен."
