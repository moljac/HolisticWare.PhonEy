#/bin/bash

PJSIP_PROJECT=pjproject-2.3
SRC_PJSIP_BZ2=$PJSIP_PROJECT.tar.bz2
SRC_PJSIP_ZIP=$PJSIP_PROJECT.zip

PJSIPPROJECTNAME=$PJSIP_PROJECT
PJSIPPROJECTFOLDER=$PJSIP_PROJECT

rm -fr SRC_PJSIP_ZIP 
if [ -f ./SRC_PJSIP_ZIP ]
	then
		echo "==================================================================="
		echo "FOUND: $SRC_PJSIP_ZIP" 	
		unzip 		$SRC_PJSIP_ZIP
	else
		echo "==================================================================="
		echo "NOT FOUND: $SRC_PJSIP_ZIP" 	
		curl -LOk http://www.pjsip.org/release/2.3/$SRC_PJSIP_ZIP
		unzip -u -d	$SRC_PJSIP_ZIP
fi

rm -fr SRC_PJSIP_BZ2 
if [ -f ./$SRC_PJSIP_BZ2 ]
	then
		echo "==================================================================="
		echo "FOUND: $SRC_PJSIP_BZ2" 	
		tar xvfj 	$SRC_PJSIP_BZ2
	else
		echo "==================================================================="
		echo "FOUND: $SRC_PJSIP_BZ2" 	
		curl -LOk http://www.pjsip.org/release/2.3/$SRC_PJSIP_BZ2
		tar xvfj 	$SRC_PJSIP_BZ2
fi

