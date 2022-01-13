#!/bin/bash

for image in $(kubeadm config images list)
do
  Path=$(echo ${image} | awk -F':' '{print $1}')
  Version=$(echo ${image} | awk -F':' '{print $2}')
  mkdir -pv ${Path}
  echo "FROM ${image}" > ${Path}/Dockerfile
done
