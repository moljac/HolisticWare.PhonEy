#/bin/bash

SRC_PJSIP_BZ2=pjproject-2.3.tar.bz2
SRC_PJSIP_ZIP=pjproject-2.3.zip

rm -fr pjproject-*.tar.bz2 
rm -fr pjproject-*.zip 

ls -al

curl -LOk http://www.pjsip.org/release/2.3/$SRC_PJSIP_BZ2
curl -LOk http://www.pjsip.org/release/2.3/$SRC_PJSIP_ZIP

ls -al

unzip 		$SRC_PJSIP_ZIP
tar xvfj 	$SRC_PJSIP_BZ2

