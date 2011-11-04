#! /bin/sh
echo Running autotools...

if test ! -d "./ookv"; then
	echo You need to link ookv to ./ookv, try ln -s
fi

if test ! -d "./oobase"; then
	echo You need to link oobase to ./oobase, try ln -s
fi

aclocal -I m4 && \
autoheader && \
libtoolize --force --no-warn && \
automake --foreign --add-missing && \
autoconf

echo Bootstrapping OOBase...
cd oobase
./bootstrap.sh
cd ..

echo Bootstrapping OOKv...
cd ookv
./bootstrap.sh
cd ..
