#!/bin/bash
set -ex

# svn2git needs a workaround to run in container:
# svn2git ask for username/password once to access the SVN repository, but does not deal correctly
# with user input. So use "svn init" to set the username/password prior running svn2git.
# Source: https://github.com/nirvdrum/svn2git/issues/59
git svn init --prefix=svn/ --trunk='trunk' svn://nddsrv10/software/Projects/PC/SpiroCoreDotNetWrapper .dummy-dir && rm -rf .dummy-dir && svn2git "$@"