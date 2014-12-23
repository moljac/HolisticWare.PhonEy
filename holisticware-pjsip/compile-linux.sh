#/bin/bash


cd /usr/src

wget http://www.pjsip.org/release/2.3/pjproject-2.3.tar.bz2

tar -xjvf pjproject*

cd /usr/src/pjproject*/

 

./configure \
	--prefix=/usr \
	--libdir=/usr/lib \
	--enable-shared --disable-sound --disable-resample --disable-video --disable-opencore-amr \
	CFLAGS='-O2 -DNDEBUG'

make dep && make && make install && ldconfig

ldconfig -p | grep pj



