#/.bin/bash

cd pjproject-2.3/

cp -f \
	../holisticware-pjsip-config-site-files/config-site-mobile-ios.h \
	pjlib/include/pj/config_site.h

rm 		-fr 	../lib/ios
rm 		-fr 	../lib

mkdir 	-fr 	../lib
mkdir 	-fr 	../lib/ios

#========================================================================
# ARMv7:
#	iPhone 		3GS, 4
#	iPad		all but iPad4
IOS_ARCH=armv7
make distclean && make clean
ARCH='-arch $IOS_ARCH' \
	./configure-iphone \
		--enable-opus-codec
	
make dep
make

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
make dep
make

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
make dep
make

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
make dep
make

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
make dep
make

find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}

#========================================================================
