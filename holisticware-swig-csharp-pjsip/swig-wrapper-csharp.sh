#!/bin/bash

rm 	-fr pjproject-2.3/pjsip-apps/src/swig/cs/
mkdir 	pjproject-2.3/pjsip-apps/src/swig/cs/ 
cd 		pjproject-2.3/pjsip-apps/src/swig/cs/ 

# http://www.swig.org/Doc1.3/CSharp.html
# swig wrapper generation
#	-c++ option needed for Visual Studio (causes problems)
swig \
	-I../../../../pjlib/include \
	-I../../../../pjlib-util/include \
	-I../../../../pjmedia/include \
	-I../../../../pjsip/include \
	-I../../../../pjnath/include \
	-w312 -c++ \
	-csharp \
	-namespace HolisticWare.PhonEy.WrapperPJSIP \
	-o pjsua2_wrap.cpp \
	../pjsua2.i

	
ls -al 
cp * ../../../../../holisticware-pjsip-ntefx/swig-generated/
ls -al ../../../../../holisticware-pjsip-ntefx/swig-generated/

cp -f \
	../../../../../holisticware-swig-csharp-pjsip/swig-generated-cs-fixes/* \
	../../../../../holisticware-pjsip-ntefx/swig-generated/