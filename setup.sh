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
