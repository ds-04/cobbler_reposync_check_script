#!/bin/bash

#Author D Simpson 2022
#Script just checks for return code in file

# Reference Define Nagios return codes
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

REPOSYNC_STATUS=/var/tmp/cobbler/reposync/reposync_status

STATUS_FROM_FILE=3
DATE_FROM_FILE=`/bin/head -n1 ${REPOSYNC_STATUS}`
STATUS_FROM_FILE=`/bin/tail -n1 ${REPOSYNC_STATUS}`

if [[ ${STATUS_FROM_FILE} -ne 0 ]]; then
   echo "ERROR: Cobbler Reposync had ERROR - ${DATE_FROM_FILE}"
   exit $STATE_CRITICAL
fi

echo "OK: Cobbler Reposync is OK, ${DATE_FROM_FILE}"
exit $STATE_OK
