# HolisticWare.PhonEy

HolisticWare SIP phone based on PJSIP

## Submodulez

*	[]()
*	[https://github.com/moljac/PJSip-CSharp.git](https://github.com/moljac/PJSip-CSharp.git)
*	[https://github.com/moljac/pjsip4net.git](https://github.com/moljac/pjsip4net.git)



## swig

*	[http://www.swig.org/tutorial.html](http://www.swig.org/tutorial.html)
*	[http://stackoverflow.com/questions/8168517/generating-java-interface-with-swig](http://stackoverflow.com/questions/8168517/generating-java-interface-with-swig)
*	[http://stackoverflow.com/questions/4255806/swig-c-bindings-with-callback](http://stackoverflow.com/questions/4255806/swig-c-bindings-with-callback)
*	[]()
*	[]()
*	[]()
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


## pjsip

https://github.com/cshipley/PJSip-CSharp
http://www.sillycodes.com/2014/09/compiling-pjsip-for-different.html

