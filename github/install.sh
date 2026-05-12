#!/bin/bash -x

export GHSRC=$GOPATH/src

mkdir -p $GHSRC/.github

export GHDIR=$GHSRC/github.com

for org in ghasemnaddaf gshirazi; do
    mkdir -p $GHDIR/$org
done

MYGITNAME=$(git config --get user.name)
if [ "$MYGITNAME" = "Ghasem Shirazi" ]; then
    cd $GHDIR/gshirazi
    git clone https://github.com/gshirazi/dotfiles-private
    ./dotfiles-private/bootstrap
else
    echo "private repos are not available for other users!"
    exit 0
fi
