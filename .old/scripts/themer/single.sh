#!/bin/bash
for f in $(ls components/);
do
  if [[ "$f" != 'template' ]]
  then
    source "components/"$f""
  fi
done
