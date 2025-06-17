#!/bin/bash

set -e  # Exit on error

# Update system and install essential packages
sudo yum update -y
sudo yum install -y docker git libicu gcc gcc-c++ make wget bzip2

# Enable Docker
sudo systemctl enable docker

# Install GLIBC 2.28
GLIBC_VERSION="2.28"
GLIBC_PREFIX="/opt/glibc-${GLIBC_VERSION}"
GLIBC_SRC_URL="http://ftp.gnu.org/gnu/libc/glibc-${GLIBC_VERSION}.tar.gz"

cd /tmp
wget $GLIBC_SRC_URL
tar -xvzf "glibc-${GLIBC_VERSION}.tar.gz"
mkdir glibc-build
cd glibc-build

../glibc-${GLIBC_VERSION}/configure --prefix=$GLIBC_PREFIX
make -j"$(nproc)"
make install

# Set up environment for all users to use the new GLIBC
echo "export LD_LIBRARY_PATH=${GLIBC_PREFIX}/lib:\$LD_LIBRARY_PATH" | sudo tee -a /etc/profile.d/glibc.sh
echo "export PATH=${GLIBC_PREFIX}/bin:\$PATH" | sudo tee -a /etc/profile.d/glibc.sh
sudo chmod +x /etc/profile.d/glibc.sh

# Optional: source it now for use in this script
source /etc/profile.d/glibc.sh

# Verify glibc version (optional check)
strings ${GLIBC_PREFIX}/lib/libc.so.6 | grep GLIBC

# Clean up build files to save AMI space (optional)
cd ~
rm -rf /tmp/glibc-${GLIBC_VERSION}*
rm -rf /tmp/glibc-build