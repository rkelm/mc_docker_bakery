#! /bin/bash
# Script to download and install all build scripts for building
# the minecraft server containers images.

echo "Running $0"
base_dir=$1
cd "$base_dir"
echo "Base install directory is ${base_dir}"

# Vanilla MC Container.
git clone https://github.com/rkelm/docker_image_mc_vanilla.git


