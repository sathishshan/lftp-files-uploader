#!/bin/bash

#usage
function usage {
	echo "USAGE: For MAN page use -m [help command]"
	echo "$0 -u Username -p 'Password' -h Host -d Domain.com -f path_to_remotefile.txt"
}

while getopts ":u:p:h:d:f:m" opt; do
	case "$opt" in
		u)
			FTPNAME=$OPTARG
			;;
		p)
			FTPPASS=$OPTARG
			;;
		h) 
			HOST=$OPTARG
			;;
		d) 
			DOMAIN=$OPTARG
			;;
		f)
			REMOTE_FILE=$OPTARG
			;;
		m | *)
		 	usage
		 	exit
		 	;;
		?)
                        echo "I don't know what $OPTARG is !!!"
                        usage
                        exit 1
			;;
	esac
done

echo "
set net:timeout 10
set ssl:verify-certificate false
set ftp:ssl-allow no
set ftp:passive-mode true
set ftp:list-options -a
open $HOST
user $FTPNAME \"$FTPPASS\"" > lftp_uploader.txt

cat "$REMOTE_FILE" 2> /dev/null | while read line
do
echo "mput -d ${line}" >> lftp_uploader.txt
done

lftp -f lftp_uploader.txt

echo "File upload successfully!"
