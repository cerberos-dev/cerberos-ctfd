#!/bin/bash

echo "Clone a pinned version of the CTFd repository to update directory"

#git clone --single-branch https://github.com/CTFd/CTFd.git CTFd_update

cd CTFd_update || exit

#find CTFd_update -name conf -prune -print0 | xargs -0 mv -v --target-directory=$(pwd)

#rm -rf ./CTFd_update



#find . -ls -name 'conf' -name 'CFTd' -prune

mv $(ls | grep -v 'conf') ./

#mv $(ls CTFd_update --ignore=file1 --ignore==folder1) ./
