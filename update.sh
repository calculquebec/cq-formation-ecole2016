#!/bin/bash

pushd $HOME/ecole2016

CONFIGS=(
	"cq-formation-openacc master" 
	"cq-formation-advanced-python ulaval"
	"introduction_R master"
	"cq-formation-premiers-pas master"
	"cq-formation-intro-openmp mcgill"
	"cq-formation-advanced-openmp mcgill"
	"cq-formation-openspeedshop master"
	"software-carpentry-unix-shell master"
	"cq-formation-intro-mpi udem"
	)

for i in $(seq 0 $(( ${#CONFIGS[@]} - 1)) ); do 
  CONFIG=${CONFIGS[$i]}
  REPO=$(echo $CONFIG | cut -d " " -f 1)
  BRANCH=$(echo $CONFIG | cut -d " " -f 2)
  if [[ ! -d $REPO ]]; then
    git clone https://github.com/calculquebec/$REPO.git
    pushd $REPO
    git checkout $BRANCH
    git pull
    popd
  else
    pushd $REPO
    git checkout $BRANCH
    git pull
    popd
  fi
done
popd

rm -rf /home/etudiant/test_michel_beland
