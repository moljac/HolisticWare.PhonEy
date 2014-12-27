#/bin/bash

Steps

Install pcre
Install swig

pcre is required to install Swig.
Please download and save anywhere
The way of installing is very straight forward

./configure
make
sudo make install
To check it, please type following command

?
1
pcre-config --version
Install PCRE under /usr/local/lib


# http://blog.colourbomb.net/?p=49

# To build and install SWIG, simply type the following:

./configure
make
# make install
# By default SWIG installs itself in /usr/local. If you need to install SWIG in a 
# different location or in your home directory, use the --prefix option to ./configure. 

./configure --prefix=/home/yourname/projects
make
# make install

# Note: the directory given to --prefix must be an absolute pathname. Do not use the ~ 
# shell-escape to refer to your home directory. SWIG won't work properly if you do this.


# Testing

# If you want to test SWIG after building it, a check can be performed on Unix operating 
# systems. Type the following:

make -k check


Add Library Path of /usr/local/lib for PCRE(Linux)

Create ~/.bashrc and add LD_LIBRARY_PATH

LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
export LD_LIBRARY_PATH

























brew install wget

# download and extract swig 
wget http://sourceforge.net/projects/swig/files/swig/swig-3.0.2/swig-3.0.2.tar.gz
tar xvzf swig-3.0.2.tar.gz 
cd swig-3.0.2 

# download and extract pcre (recquired for MAC OS X only) 
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.36.tar.gz 
tar xvzf pcre-8.36.tar.gz 
Tools/pcre-build.sh 




# configure, build, install swig in $HOME/local 
 ./configure --prefix=$HOME/local/swig/3.0.2 
 make 
 make install 

# my shell is bash, so I use bash syntax to set environnment variables 
 echo $SHELL 
/bin/bash 

# there was already an installed swig in /usr/bin 
 which swig 
/usr/bin/swig 

# which version is 2.0.4 
 swig -version 
SWIG Version 2.0.4 
... 

# with its library being in: (directory containing for example 
# the file 'swig.swg') 
 swig -swiglib 
/usr/share/swig2.0 

# PATH environnement variable is a list of directories, separated by ':',                                 
# When an executable is invoked, it is searched in these directories, starting 
# from the first, until executable if found.  Currently, the swig executable 
# located in /usr/bin is used (see 'which swig' command). 
echo $PATH 
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 

# the new swig I've just compiled is located in 
# /Users/david/local/swig/2.0.7/bin, so I add this directory 
# before /usr/bin, so this swig is choosen rather that /usr/bin/swig 
# Be carefull to not delete PATH. basic commands such as /bin/ls, /usr/bin/cd ... 
# would become inaccessible. 
export PATH=/Users/david/local/swig/2.0.7/bin:$PATH 

# checking it's ok 
 echo $PATH 
/Users/david/local/swig/2.0.7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 
 which swig 
/Users/david/local/swig/2.0.7/bin/swig 

# swig lib is already ok, no need to set SWIG_LIB 
 swig -swiglib 
/Users/david/local/swig/2.0.7/share/swig/2.0.7 

# To make the modification permanent, I add this line to my ~/.bashrc or 
# ~/.profile 
export PATH=/Users/david/local/swig/2.0.7/bin:$PATH 
