#!/bin/bash

mkdir -p $HOME/ecole2016
pushd $HOME/ecole2016

REPOS=(cq-formation-openacc cq-formation-advanced-python)
BRANCHES=(master ulaval)

for i in $(seq 0 $(( ${#REPOS[@]} - 1)) ); do 
  REPO=${REPOS[$i]}
  BRANCH=${BRANCHES[$i]}
  if [[ ! -d $REPO ]]; then
    git clone https://github.com/calculquebec/$REPO.git
    cd $REPO
    git checkout $BRANCH
    git pull
  else
    pushd $REPO
    git checkout $BRANCH
    git pull
    popd
  fi
done
popd

