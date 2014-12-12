#/bin/bash

PJSIPPROJECTFOLDER=pjproject-2.3

cp -f \
	config_site_ios.h \
	$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
ls -al \
	$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
cat \
	$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h

cd $PJSIPPROJECTFOLDER/
chmod 700 ./configure*
./configure-iphone 
chmod 700 ./aconfigure

brew install dos2unix

dos2unix ./configure*
dos2unix ./aconfigure



export ANDROID_NDK_ROOT=~/Library/Developer/Xamarin/android-ndk/android-ndk-r8d 
./configure-android 

./configure-iphone 
make dep && make clean && make




./configure-iphone
make dep && make clean && make
# For iPhone 5, use armv7s architecture 
# (only when libyuv is not used, because libyuv does not support armv7s):

cd /path/to/your/pjsip/dir
ARCH='-arch armv7s' ./configure-iphone
make dep && make clean && make