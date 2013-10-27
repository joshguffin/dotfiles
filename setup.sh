#!/usr/bin/env bash

##
## Obtain current directory
## from http://stackoverflow.com/a/246128/464289
##
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

## Ignore setup.sh
cd $DIR
RESOURCES=`/bin/ls | sed 's/setup.sh//'`

RESULT="Source Target"
for resource in $RESOURCES;
do
   FILEPATH=$DIR/$resource
   if [ ! -e $FILEPATH ]; then
      echo "Resource $FILEPATH not available!"
      exit 1
   fi

   TARGET=$HOME/.$resource
   rm -f $TARGET
   ln -s $FILEPATH $TARGET
   RESULT="$RESULT\n$FILEPATH $TARGET"
done

/bin/echo -e $RESULT | column -t -s' '
/bin/echo -e "\nFinished linking files!"

mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/bundle;

## Install vundle
if [ ! -e $HOME/.vim/bundle/vundle ]; then
   git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

## set up configured vundles
vim +BundleInstall +qall

## Install pathogen
if [ ! -e $HOME/.vim/autoload/pathogen.vim ]; then
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

## Install syntastic
if [ ! -e $HOME/.vim/bundle/syntastic ]; then
   git clone https://github.com/scrooloose/syntastic.git \
      $HOME/.vim/bundle/syntastic
fi


