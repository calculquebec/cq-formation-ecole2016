#!/bin/bash


# self update
pushd $HOME/cq-formation-ecole2016
git pull
popd

# clone and/or update repos
mkdir -p $HOME/ecole2016
#$HOME/cq-formation-ecole2016/update.sh
