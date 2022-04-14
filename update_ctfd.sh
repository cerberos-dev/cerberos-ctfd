#!/usr/bin/env bash

echo "Cloning a pinned version of the CTFd repository to update directory"

git clone --single-branch 'https://github.com/CTFd/CTFd.git' CTFd_update

echo "Moving files to project root"

mv ./CTFd_update/* ./ 2> /dev/null

echo "Removing update directory"

rm -rf ./CTFd_update
