#!/bin/bash

# Install packages required by Singularity
apt-get update
apt-get install -y build-essential libseccomp-dev libglib2.0-dev \
                   pkg-config squashfs-tools cryptsetup wge

# Install Go
cd /tmp && wget https://dl.google.com/go/go1.20.6.Linux-amd64.tar.gz
tar -C /usr/local -xzvf go1.20.6.Linux-amd64.tar.gz
rm go1.20.6.Linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
eval "$(cat ~/.bashrc | tail -n +10)"

# Install Singularity
wget https://github.com/sylabs/singularity/releases/download/v3.11.4/singularity-ce-3.11.4.tar.gz
tar -xzf singularity-ce-3.11.4.tar.gz
cd singularity-ce-3.11.4
echo "installing singularity..."
./mconfig && make -C ./builddir && make -C ./builddir install
echo "successfully installed $(singularity --version)."
