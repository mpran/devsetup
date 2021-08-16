#!/usr/bin/env bash

if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   echo "Xcode Installed"
else
   xcode-select --install
fi

which -s brew
if [[ $? != 0 ]] ; then
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install git
else
    echo "Brew installed"
fi

which -s ansible
if [[ $? != 0 ]] ; then
    brew install ansible
else
    echo "Ansible installed"
fi

which -s docker
if [[ $? != 0 ]] ; then
    brew install --cask docker
    open --background -a Docker
    while ! docker system info > /dev/null 2>&1; do sleep 1; done
else
    echo "Docker installed"
fi
