#!/bin/bash
abort() {
    local message=$1
    echo $message
    exit -1
}
[ -z $FTP_PASS ] && abort "FTP_PASS is undefined"
[ -z $FTP_USER ] && abort "FTP_USER is undefined"
[ -z $FTP_SITE ] && abort "FTP_SITE is undefined"
lftp -d -u $FTP_USER,$FTP_PASS $FTP_SITE:21 \
 -e 'set ftp:passive-mode on; set ssl:verify-certificate no; debug 9; mirror --ignore-time --parallel=10 -e -v -R _site ~ ; exit'