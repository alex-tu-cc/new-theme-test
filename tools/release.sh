#!/bin/bash

set -x 
set -e
usage() {
cat << EOF
usage: $0 options

    -h|--help print this message
    --remote  set the remote target
EOF
exit 1
}

while [ $# -gt 0 ]
do
    case "$1" in
        -h | --help)
            usage 0
            exit 0
            ;;
#        --dry-run)
#            DRY_RUN=1;
#            ;;
        --remote)
            shift
            REMOTE=$1
            ;;
        *)
        usage
       esac
       shift
done

# push backbone
git push $REMOTE backbone
# push posts
git push $REMOTE posts
# gh_pages merge backbone, then merge posts
git checkout gh-pages
git merge --no-ff $REMOTE/backbone
git merge --no-ff $REMOTE/posts
git push $REMOTE gh-pages

