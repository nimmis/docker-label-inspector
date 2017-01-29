#!/bin/sh

get_dockerfile() {

  rm -f /dli/Dockerfile
  while read line
  do
    echo $line >> /dli/Dockerfile
  done
}

#
# main
#

if [ -n "$1" ]; then

  case $1 in
    lint)
	get_dockerfile
	dli lint --dockerfile=/dli/Dockerfile
        ;;

    validate)
	get_dockerfile
	dli validate --dockerfile=/dli/Dockerfile --schema=/dli/schema.json
        ;;
    *)
	dli
	exit 1
        ;;
  esac
else
 dli
 exit 1
fi
