#! /bin/bash
# Script to download and install all build scripts for building
# the minecraft server containers images.

echo "Running $0"

target_dir=$1

#if [ -z "$target_dir" ] ; then
	# The project directory is the folder containing this script.
#	_dir=$( dirname "$0" )
#	project_dir=$( ( cd "$_dir" && pwd ) )
#fi

if [ ! -d "$target_dir" ] ; then
	echo "Error: Target directory not specified or directory '$target_dir' does not exist."	
	exit 1
fi
	
cd "$target_dir"
echo "Base install directory is ${target_dir}"

# Vanilla MC Container.
git clone https://github.com/rkelm/docker_image_mc_vanilla.git
git clone https://github.com/rkelm/docker_image_mc_spigot.git
git clone https://github.com/rkelm/docker_image_mc_spigot_worldedit.git
git clone https://github.com/rkelm/docker_image_mc_overviewer.git
git clone https://github.com/rkelm/docker_image_mc_overviewer_batch.git


