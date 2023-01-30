#!/bin/bash

filename='domainlist.txt'
while read line; do
  /root/createLetsencrypt.sh $line
  sleep 5
done < $filename
