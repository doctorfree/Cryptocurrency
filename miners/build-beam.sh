#!/bin/bash

project="beam"
TOP="$HOME/src/Cryptocurrency/miners"

[ -d "$TOP" ] || {
    echo "$TOP does not exist or is not a directory. Exiting."
    exit 1
}

cd "$TOP"
[ -d beam ] || {
    [ -x ./clone-beam.sh ] || {
        echo "$TOP/clone-beam.sh does not exist or is not executable. Exiting."
        exit 2
    }
    ./clone-beam.sh
}
cd beam
#cmake ..
export CC=gcc-8 && export CXX=g++-8
cmake -DCMAKE_BUILD_TYPE=Release && make -j4
[ "$1" == "-i" ] && {
    sudo make install
}
