#/bin/bash

PJSIPPROJECTFOLDER=pjproject-2.3
PJSIP_MODULES=\
"
	pjlib
	pjlib-util
	pjmedia
	pjnath
	pjsip
	third-party
"

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
chmod 700 ./aconfigure

brew install dos2unix

dos2unix ./configure*
dos2unix ./aconfigure

[ -d ../lib ] && ls -R ../lib/ || mkdir ../lib/
rm 	  -fr 	../lib/ios/
mkdir 	 	../lib/ios/

# Building with GNU tools (Linux, *BSD, MacOS X, mingw, etc.)
# Generally these should be all that are needed to build the 
#		libraries, 
#		applications, and 
#		samples


#========================================================================
# ARMv7:
#	iPhone 		3GS, 4
#	iPad		all but iPad4
# ARMv7s:
#	iPhone 		5, 5c
#	iPad		4
# ARMv64:
#	iPhone 		5s
#	iPad		Air
# i386:
#	iPhone 		Simulator
#	iPad		Simulator

IOS_ARCHITECTURES=\
"
	armv7
	armv7s 
	arm64 
	i386 
"	
			
for a in $IOS_ARCHITECTURES
	do
		echo $a
		IOS_ARCH=$a
		echo '-arch '"$a"' '
		
		# https://trac.pjsip.org/repos/wiki/Getting-Started/iPhone
		# http://www.sillycodes.com/2014/09/compiling-pjsip-for-different.html
		make distclean && make clean
		ARCH='-arch '"$a"' ' \
		CFLAGS='-O3' \
		LDFLAGS='-O3' \
			./configure-iphone \
				--enable-opus-codec
			
		make dep && make clean && make

		find . 		-type f -name "*.a" | xargs ls -al 
		find `pwd` 	-type f -name "*.a" | xargs lipo -info 

		rm 	  -fr 	../lib/ios/$IOS_ARCH/
		mkdir  	 	../lib/ios/$IOS_ARCH/

		for l in $PJSIP_MODULES
			do
				ls -alR ./$l/lib/
				cp -f ./$l/lib/*.a ../lib/ios/$IOS_ARCH/
		done
done


# libpj-arm-apple-darwin9.a
# libpjlib-util-arm-apple-darwin9.a
# libpjmedia-arm-apple-darwin9.a
# libpjmedia-audiodev-arm-apple-darwin9.a
# libpjmedia-codec-arm-apple-darwin9.a
# libpjmedia-videodev-arm-apple-darwin9.a
# libpjnath-arm-apple-darwin9.a
# libpjsdp-arm-apple-darwin9.a
# libpjsip-arm-apple-darwin9.a
# libpjsip-simple-arm-apple-darwin9.a
# libpjsip-ua-arm-apple-darwin9.a
# libpjsua-arm-apple-darwin9.a
# libpjsua2-arm-apple-darwin9.a

LIBS=\
"
	libpj 
	libpjlib-util 
	libpjmedia 
	libpjmedia 
	libpjmedia-codec 
	libpjmedia-videodev 
	libpjnath 
	libpjsdp 
	libpjsip 
	libpjsip 
	libpjsip-ua 
	libpjsua 
	libpjsua2 
"

for lib in $LIBS
	do
		echo $lib
		lipo \
			-output ../lib/ios/$lib-arm-apple-darwin9.a \
			-create \
				../lib/ios/arm64/$lib-arm-apple-darwin9.a \
				../lib/ios/arm7/$lib-arm-apple-darwin9.a \
				../lib/ios/arm7s/$lib-arm-apple-darwin9.a \
				../lib/ios/i386/$lib-arm-apple-darwin9.a \
								
								
		lipo -info 	../lib/ios/$lib-arm-apple-darwin9.a					
								
done

ls -al ../lib/ios/
	
