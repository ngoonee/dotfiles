#!/bin/sh
# Find libraries (and packages) that link to a library matching a given pattern.
# First argument: library folder (e.g. /opt/ros/hydro/lib)
# Second argument: library dependency (or pattern)
for lib in $(find $1 -name \*.so) ; do
res=`ldd -v $lib | grep $2`
if [ ! -z "$res" ]; then
echo "$res"
echo "`pacman -Qo $lib`"
fi
done
