#/bin/bash

PJSIP_VERSION=2.4
PJSIPPROJECTFOLDER=pjproject-$PJSIP_VERSION

#---------------------------------------------------------------------------------------
cp -f \
	./holisticware-pjsip-compile-scripts/config-site-files/config-site-desktop-mac-osx.h \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
ls -al \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
cat \
	./$PJSIPPROJECTFOLDER/pjlib/include/pj/config_site.h
#---------------------------------------------------------------------------------------


cd ./$PJSIPPROJECTFOLDER

# Building with GNU tools (Linux, *BSD, MacOS X, mingw, etc.)
# Generally these should be all that are needed to build the 
#		libraries, 
#		applications, and 
#		samples


make distclean && make clean
./configure
make dep && make clean && make

find . 		-type f -name "*.a" | xargs ls -al {}
find `pwd` 	-type f -name "*.a" | xargs lipo -info {}



ls -al \	
	./pjsip-apps/bin/

#=====================================================================
# test
./pjsip-apps/bin/pjsua-x86_64-apple-darwin14.3.0 \
	sip:301@ideasip.com
	
	
./pjsip-apps/bin/pjsua-x86_64-apple-darwin13.4.0 \
	sip:echo@iptel.org
#=====================================================================

	
#=====================================================================
# 
#=====================================================================

	