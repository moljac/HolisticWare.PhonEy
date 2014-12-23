#/bin/bash


cd ../submodulez/
rm -fr ./PJsip-CSharp/
rm -fr ./pjsip4net/
rm -fr ./swig/

git submodule update --init --recursive


cd swig/
