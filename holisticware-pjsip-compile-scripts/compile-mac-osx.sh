#/bin/bash

PJSIPPROJECTFOLDER=pjproject-2.3


# Building with GNU tools (Linux, *BSD, MacOS X, mingw, etc.)
# Generally these should be all that are needed to build the 
#		libraries, 
#		applications, and 
#		samples
cd ./$PJSIPPROJECTFOLDER

make distclean && make clean
./configure
make dep && make clean && make

#=====================================================================
# test
./pjsip-apps/bin/pjsua-x86_64-apple-darwin13.4.0 \
	sip:301@ideasip.com
	
	
./pjsip-apps/bin/pjsua-x86_64-apple-darwin13.4.0 \
	sip:echo@iptel.org
#=====================================================================

	
#=====================================================================
# 
#=====================================================================

	