#!/bin/bash

# Determine current path the script

SRC="${BASH_SOURCE[0]}"
while [ -h "$SRC" ]; do
  DIR="$( cd -P "$( dirname "$SRC" )" >/dev/null 2>&1 && pwd )"
  SRC="$(readlink "$SRC")"
  [[ $SRC != /* ]] && SRC="$DIR/$SRC"
done
DIR="$( cd -P "$( dirname "$SRC" )" >/dev/null 2>&1 && pwd )"SRC="${BASH_SOURCE[0]}"
while [ -h "$SRC" ]; do
  DIR="$( cd -P "$( dirname "$SRC" )" >/dev/null 2>&1 && pwd )"
  SRC="$(readlink "$SRC")"
  [[ $SRC != /* ]] && SRC="$DIR/$SRC"
done
DIR="$( cd -P "$( dirname "$SRC" )" >/dev/null 2>&1 && pwd )"

# change directory to script's path
cd $DIR

echo "Current directory: $PWD"

CRT_REPO_URL='git@github.ibm.com:gensec/OperatorVault-Wiki.wiki.git'
CRT_REPO_NAME='OperatorVault-Wiki.wiki'
CRT_PATH="${CRT_REPO_NAME}/files/certs"
CRT_EXTNS='crt'
PKG_OP_DIR=${BUILD_ROOT:-'.'}
PKG_VER=$(<../hack/ci/version.txt)

#
# Clone CRT repo to local
#
clone_crt_repo()
{
    echo "Cloning vault certificate repo with URL ${CRT_REPO_URL}"
    git clone ${CRT_REPO_URL}
}

#
# Copy certificates with extension crt
#
copy_certifcates()
{
    rm -rf vaultpkicerts/usr/local/share/ca-certificates/*.${CRT_EXTNS}
    
    mkdir -p vaultpkicerts/usr/local/share/ca-certificates
  
    echo 'Copying certificates to build path'
    cp ${CRT_PATH}/*.${CRT_EXTNS} vaultpkicerts/usr/local/share/ca-certificates/
  
    echo 'List of  copied certificates: '
    ls -la vaultpkicerts/usr/local/share/ca-certificates/   
}

#
# Build debian package with pki certs
#
build_package()
{
    dpkg-deb --build vaultpkicerts/  
} 

#
# Remove cloned repo and clean the copied certificates
#
clean()
{
    rm -rf ${CRT_REPO_NAME}/

    rm -rf vaultpkicerts/usr/local/share/ca-certificates/*.${CRT_EXTNS}

    echo "Cloned directory and copied certicates are removed successfully"
}

#
# Move debian package to desired directory
#
move_pkg(){
    mkdir -p ${PKG_OP_DIR}/build
    mv vaultpkicerts.deb ${PKG_OP_DIR}/build/vaultpkicerts_${PKG_VER}_amd64.deb
}

# Error exit function

error_abort()
{
   echo "$1" 1>&2
   exit 1
}

#
# Execution
#
echo ' *** CLONE REPO ***'
if clone_crt_repo; then
  echo ' *** COPY PKI CERTIFICATES ***'
else
  error_abort "Couldn't clone repo. Aporting."
fi

 
if copy_certifcates; then
  echo ' *** BUILD DEBIAN PACKAGE ***'
else
  clean
  error_abort "Couldn't copy certifates for build. Aborting" 
fi

if build_package; then
echo ' *** MOVE TO OUTPUT DIR ***'
else 
  error_abort "Couldn't build the debian package. Aborting"
fi

if move_pkg; then
echo ' *** CLEAN ***'
else
  error_abort "Couldn't move the debian package. Aborting"
fi


 clean

exit 0;
