#/bin/bash

PJSIPPROJECTFOLDER=pjproject-2.3

cd $PJSIPPROJECTFOLDER

export ANDROID_NDK_ROOT=~/Library/Developer/Xamarin/android-ndk/android-ndk-r10d

PATH=$PATH:$ANDROID_NDK_ROOT
export PATH

cd pjsip-apps/src/pjsua/android

ndk-build