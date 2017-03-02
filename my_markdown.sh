#!/bin/sh
#list directory only
DLIST=$(ls -F | grep /)
for i in $DLIST;
do
  echo $i
done
