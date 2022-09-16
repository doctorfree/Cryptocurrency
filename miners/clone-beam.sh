#!/bin/bash

project="beam"

[ -d ${project} ] && {
    rm -rf ${project}-
    mv ${project} ${project}-
}

git clone https://github.com/BeamMW/${project}.git
cd ${project}
git submodule update --init --recursive
