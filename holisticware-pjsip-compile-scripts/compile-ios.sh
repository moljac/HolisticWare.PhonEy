#/bin/bash

PJSIPPROJECTFOLDER=pjproject-2.3

#---------------------------------------------------------------------------------------
cp -f \
	./holisticware-pjsip-compile-scripts/config-site-files/config-site-mobile-ios.h \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
ls -al \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
cat \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
#---------------------------------------------------------------------------------------


cd ./$PJSIPPROJECTFOLDER/

chmod 700 ./configure*
./configure-iphone
chmod 700 ./aconfigure

brew install dos2unix

dos2unix ./configure*
dos2unix ./aconfigure

rm 		-fr 	../lib/ios/
mkdir 	-fr 	../lib/ios/

# Building with GNU tools (Linux, *BSD, MacOS X, mingw, etc.)
# Generally these should be all that are needed to build the 
#		libraries, 
#		applications, and 
#		samples

#========================================================================
# ARMv7:
#	iPhone 		3GS, 4
#	iPad		all but iPad4
IOS_ARCH=armv7
make distclean && make clean
ARCH='-arch $IOS_ARCH' \
	./configure-iphone \
		--enable-opus-codec	
make dep && make clean && make

find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}

rm 		-fr 	../lib/ios/$IOS_ARCH/
mkdir 	-fr 	../lib/ios/$IOS_ARCH/

#========================================================================

#========================================================================
# ARMv7s:
#	iPhone 		5, 5c
#	iPad		4
make distclean && make clean
ARCH='-arch armv7s' \
	./configure-iphone \
		--enable-opus-codec
		
make dep && make clean && make

find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}

rm 		-fr 	../lib/ios/armv7s/
mkdir 	-fr 	../lib/ios/armv7s/

find . -type f -name "*.a" | xargs ls -al {}
#========================================================================


#========================================================================
# ARMv64:
#	iPhone 		5s
#	iPad		Air
make distclean && make clean
ARCH='-arch armv64' \
	./configure-iphone \
		--enable-opus-codec

make dep && make clean && make
		
find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}

#========================================================================


#========================================================================
# i386:
#	iPhone 		Simulator
#	iPad		Simulator
make distclean && make clean
export DEVPATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/
ARCH='-arch i386' \
	CFLAGS="-O2 -m32 -mios-simulator-version-min=5.2" \
	LDFLAGS="-O2 -m32 -mios-simulator-version-min=5.2" \
	./configure-iphone \
		--enable-opus-codec

make dep && make clean && make
		
find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}

#========================================================================

#========================================================================
# x86_64:
#	iPhone 		Simulator
#	iPad		Simulator
make distclean && make clean
export DEVPATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/
ARCH='-x86_64' \
	CFLAGS="-O2 -m32 -mios-simulator-version-min=5.2" \
	LDFLAGS="-O2 -m32 -mios-simulator-version-min=5.2" \
	./configure-iphone \
		--enable-opus-codec

make dep && make clean && make

find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}

#========================================================================
