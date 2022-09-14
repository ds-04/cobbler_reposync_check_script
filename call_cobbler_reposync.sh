#!/bin/bash

#Author D Simpson 2022

DATE_NOW=`date +%F_%H_%M`
REPOSYNC_STATUS=/var/tmp/cobbler/reposync/reposync_status

#create dir if not existing
if [ ! -d /var/tmp/cobbler/reposync ]; then
    /bin/mkdir -p /var/tmp/cobbler/reposync;
fi;

/bin/echo "Cobbler reposync - ${DATE_NOW}" > ${REPOSYNC_STATUS}
#run reposync
/bin/cobbler reposync; echo $? >> ${REPOSYNC_STATUS}
