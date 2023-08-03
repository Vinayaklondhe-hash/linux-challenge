#!/bin/bash

echo "-----------------------"
echo "This script will take backup"

if [ $# -eq 0 ]; then
        echo "please enter the directory to backup"
fi
backup_function()
{
     local backupdir="$1" 
       local  backupdate=$(date '+%Y-%m-%d_%H-%M-%S')
        local backup_folder="${backupdir}/backup_${backupdate}"

        mkdir -p ${backup_folder}
        #cp -r "${backupdir}"/* "${backup_folder}"  this line will create backup dir folder inside backup folder so use resync
	rsync -a --exclude "backup_*" "${backupdir}/" "${backup_folder}"
        echo "backup completed"
}
backup_rotation()
{
local backupdir="$1"
backuplist=$( ls -t ${backupdir} |grep ^backup)
backuptokeep=3
backupcount=$( echo "${backuplist}" | wc -l)
if [ "${backupcount}" -gt "${backuptokeep}" ] ; then

backup_remove=$(( ${backupcount} - ${backuptokeep} ))
echo "${backuplist}" | tail -n "${backup_remove}" | while IFS= read -r backup; do
            rm -r "${backupdir}/${backup}"
        done
#echo "${backuplist}" | tail -n "${backup_remove}" | xargs -I {} rm -r "${backuplist}/{}"
else
	echo "no rotation required"
fi

}
backupdir="$1"
backup_function "${backupdir}"
backup_rotation "${backupdir}"
