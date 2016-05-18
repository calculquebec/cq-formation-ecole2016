#!/bin/bash

pushd $HOME

REPOS="cq-formation-openacc"

for REPO in $REPOS; do 
  if [[ ! -d $REPO ]]; then
    git clone https://github.com/calculquebec/$REPO.git
  else
    pushd $REPO
    git pull
    popd
  fi
done
popd

