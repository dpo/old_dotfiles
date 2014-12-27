#!/bin/bash

for module in $@
do
  git submodule deinit -f bundle/$module 2>/dev/null
  git rm -f bundle/$module 2>/dev/null
  rm -rf .git/modules/bundle/$module 2>/dev/null
done
