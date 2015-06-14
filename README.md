# HolisticWare.PhonEy

HolisticWare SIP phone based on PJSIP

## Prerequisites

PJsip is SIP protocl stack library written in c/c++. In order to use it with Xamarin technology
user will need:

1.	to compile pjsip c/c++ code with native tools
2.	wrap c/c++ code with c# - enable c# calls to native c/c++ 	
	PInvoke	

Planned platforms 2014-12-23:

*	mobile		
	*	Xamarin.iOS classic and unified		
	*	Xamarin.Android		
	*	Windows Phone 8.x	
*	desktop	
	*	Windows (.net runtime)
	*	Mac OSX
	* 	linux
	
## Prerequisites

tools needed

1.	pjsip SIP stack code		
2.	swig (Simple Wrapper and Interface Generator)	
	1.	installed as package		
	2.	compiled and installed from code		

		
## Samples

### iOS

#### Tutorials HOWTOs

*	[http://www.xianwenchen.com/blog/2014/06/09/how-to-make-an-ios-voip-app-with-pjsip-part-1/](http://www.xianwenchen.com/blog/2014/06/09/how-to-make-an-ios-voip-app-with-pjsip-part-1/)
*	[https://tharindufit.wordpress.com/2010/06/18/how-to-compile-siphon-for-non-jail-broken-iphone-make-voip-calls-on-wifi/](https://tharindufit.wordpress.com/2010/06/18/how-to-compile-siphon-for-non-jail-broken-iphone-make-voip-calls-on-wifi/)
*	[http://www.wenda.io/questions/189800/how-to-build-and-compile-pjsip-for-xcode-using-sample-code-ipjsua-to-test.html](http://www.wenda.io/questions/189800/how-to-build-and-compile-pjsip-for-xcode-using-sample-code-ipjsua-to-test.html)
*	[http://www.phonesdevelopers.com/1726086/](http://www.phonesdevelopers.com/1726086/)
*	[]()
*	[]()


#### Apps

*	[https://code.google.com/p/siphon](https://code.google.com/p/siphon)
*	[]()

### Android 

#### Tutorials HOWTOs

*	[https://trac.pjsip.org/repos/wiki/Getting-Started/Android](https://trac.pjsip.org/repos/wiki/Getting-Started/Android)
*	[http://stackoverflow.com/questions/20193956/how-to-use-pjsip-on-android-device-in-order-to-have-g-729-codec-functionality](http://stackoverflow.com/questions/20193956/how-to-use-pjsip-on-android-device-in-order-to-have-g-729-codec-functionality)
*	[http://stackoverflow.com/questions/12936812/building-apjsua-sample-application-of-pjsip-for-android](http://stackoverflow.com/questions/12936812/building-apjsua-sample-application-of-pjsip-for-android)
*	[http://www.bdsound.com/support/how-to-build-and-run-pjsip-2-2-with-bdimad-for-android/](http://www.bdsound.com/support/how-to-build-and-run-pjsip-2-2-with-bdimad-for-android/)
*	[http://myandroidtuts.blogspot.com/2014/03/building-voip-application-in-android.html](http://myandroidtuts.blogspot.com/2014/03/building-voip-application-in-android.html)
*	[https://srikayala.wordpress.com/2013/12/05/pjsip-for-android-installation-on-mac-osx-mavericks/](https://srikayala.wordpress.com/2013/12/05/pjsip-for-android-installation-on-mac-osx-mavericks/)

#### Apps

*	[]()
*	[]()
*	[]()
*	[http://android.wooyd.org/](http://android.wooyd.org/)


## Steps	

### c/c++ compileation of the code

1.	the code		
	[https://github.com/cshipley/PJSip-CSharp](https://github.com/cshipley/PJSip-CSharp)
2.	compile 
	1.	mobile			
		1.	iOS 		
			[http://www.sillycodes.com/2014/09/compiling-pjsip-for-different.html](http://www.sillycodes.com/2014/09/compiling-pjsip-for-different.html)




### c# wrappers generation with SWIG


Enum problems (TODO - read more about it)

in pjsip-apps/src/swig/symbols.iOS

	typedef enum pjmedia_format_id {PJMEDIA_FORMAT_L16 = 0, PJMEDIA_FORMAT_PCM = PJMEDIA_FORMAT_L16, PJMEDIA_FORMAT_PCMA = ((('W' << 24) | ('A' << 16)) | ('L' << 8)) | 'A', PJMEDIA_FORMAT_ALAW = PJMEDIA_FORMAT_PCMA, PJMEDIA_FORMAT_PCMU = ((('W' << 24) | ('A' << 16)) | ('L' << 8)) | 'u', PJMEDIA_FORMAT_ULAW = PJMEDIA_FORMAT_PCMU, PJMEDIA_FORMAT_AMR = ((('R' << 24) | ('M' << 16)) | ('A' << 8)) | ' ', PJMEDIA_FORMAT_G729 = ((('9' << 24) | ('2' << 16)) | ('7' << 8)) | 'G', PJMEDIA_FORMAT_ILBC = ((('C' << 24) | ('B' << 16)) | ('L' 

SWIG

	PJMEDIA_FORMAT_AMR = (((R << 24)|(M << 16))|(A << 8))| ,
	PJMEDIA_FORMAT_G729 = (((9 << 24)|(2 << 16))|(7 << 8))|G,
	PJMEDIA_FORMAT_ILBC = (((C << 24)|(B << 16))|(L << 8))|I,
	PJMEDIA_FORMAT_RGB24 = (((3 << 24)|(B << 16))|(G << 8))|R,

Manually converted to:

	PJMEDIA_FORMAT_AMR = ((('R' << 24)|('M' << 16))|('A' << 8))| ' ',
	PJMEDIA_FORMAT_G729 = ((('9' << 24)|('2' << 16))|('7' << 8))|'G',
	PJMEDIA_FORMAT_ILBC = ((('C' << 24)|('B' << 16))|('L' << 8))|'I',
	PJMEDIA_FORMAT_RGB24 = ((('3' << 24)|('B' << 16))|('G' << 8))|'R',

## git submodulez

*	[https://github.com/moljac/PJSip-CSharp.git](https://github.com/moljac/PJSip-CSharp.git)
*	[https://github.com/moljac/pjsip4net.git](https://github.com/moljac/pjsip4net.git)
*	[]()


## Tools

###  CppSharp

*	[https://github.com/mono/CppSharp](https://github.com/mono/CppSharp)


### swig

*	[http://www.swig.org/tutorial.html](http://www.swig.org/tutorial.html)
*	[http://stackoverflow.com/questions/8168517/generating-java-interface-with-swig](http://stackoverflow.com/questions/8168517/generating-java-interface-with-swig)
*	[http://stackoverflow.com/questions/4255806/swig-c-bindings-with-callback](http://stackoverflow.com/questions/4255806/swig-c-bindings-with-callback)
*	[]()



	%module(directors="1") test

	%{
	#include <iostream>
	#include "module.hh"
	%}

	%feature("director") Interface;
	%include "std_string.i"

	// (2.1)
	%rename(NativeInterface) Interface; 

	// (2.2)
	%typemap(jstype) const Interface& "Interface";

	// (2.3)
	%typemap(javainterfaces) Interface "Interface"

	// (2.5)
	%typemap(javain,pgcppname="n",
			 pre="    NativeInterface n = makeNative($javainput);")
			const Interface&  "NativeInterface.getCPtr(n)"

	%include "module.hh"



