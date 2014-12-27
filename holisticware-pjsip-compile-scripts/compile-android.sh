#/bin/bash

PJSIPPROJECTFOLDER=pjproject-2.3

#---------------------------------------------------------------------------------------
cp -f \
	./holisticware-pjsip-compile-scripts/config-site-files/config-site-mobile-android.h \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
ls -al \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
cat \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
#---------------------------------------------------------------------------------------

cd ../$PJSIPPROJECTFOLDER

export ANDROID_NDK_ROOT=~/Library/Developer/Xamarin/android-ndk/android-ndk-r8d
./configure-android

rm 		-fr 	../lib/android/
mkdir 	-fr 	../lib/android/

# Building with GNU tools (Linux, *BSD, MacOS X, mingw, etc.)
# Generally these should be all that are needed to build the 
#		libraries, 
#		applications, and 
#		samples


# APP_PLATFORM     
#		Optionally specify the platform level used
#				android-10
#		Default, configure will use the "maximum platform level detected."
# TARGET_ABI       
#		Optionally specify a single target architecture
#				armeabi-v7a
#				mips
#				x86
#		Default, the target architecture is 
#				armeabi
#		Only used when --use-ndk-cflags is specified

#--------------------------------------------------------------------
make distclean && make clean
TARGET_ABI=armeabi-v7a \
	./configure-android \
	--use-ndk-cflags
	
make dep && make clean && make
#--------------------------------------------------------------------


#--------------------------------------------------------------------
make distclean && make clean
TARGET_ABI=armeabi \
	./configure-android \
	--use-ndk-cflags
	
make dep && make clean && make
#--------------------------------------------------------------------


#--------------------------------------------------------------------
make distclean && make clean
TARGET_ABI=x86 \
	./configure-android \
	--use-ndk-cflags
	
make dep && make clean && make
#--------------------------------------------------------------------


#--------------------------------------------------------------------
make distclean && make clean
TARGET_ABI=mips \
	./configure-android \
	--use-ndk-cflags
	
make dep && make clean && make
#--------------------------------------------------------------------




# compile with OpenSSL support and integrate it with PJSIP, 
# TODO: 		compile OpenSSL
# workaround:	port of OpenSSL for Android.


# build using ndk-build command


# go to pjsip/src folder and run the following command
# ./configure-android --with-ssl=/path/to/compiled-openssl-folder


to build for other targets, e.g: arm64 (arm64-v8a), x86, or armv7, instead of just './configure-android', specify the target arch in TARGET_ABI and run it, for example:
for some targets, there may be error like
# error: undefined reference to '__stack_chk_fail_local'
# this can be fixed by adding -fno-stack-protector into CFLAGS, e.g: via user.mak file.
# the ./configure-android is a wrapper that calls the standard ./configure script with settings suitable for Android target.
# you may pass standard ./configure options to this script too.
for more info, run ./configure-android --help
other customizations are similar to what is explained in Building with GNU page.

