#!/bin/bash
# Christian Ortiz (@statsconchris) script was inspired on: https://gitlab.com/singularityhub/gitlab-ci
# Christian Ortiz (@stastconchris) script does not pull the container image files to the hub.
# Christian Ortiz (@statsconchris) script handles newer singularity versions with go.


######################################### Recipe File ################################################

if [ $# == 0 ] ; then
    recipe="Singularity"
else
    recipe=$1
fi

echo ""
echo "Image Recipe: ${recipe}"


######################################### Build Image ################################################


if [ -f "$recipe" ]; then

    imagefile="${recipe}.sif"

    echo "Creating $imagefile using $recipe..."
    singularity build --fakeroot $imagefile $recipe
    # fakeroot is used because gitlab-runner is the uid but we need root to build
    # in your local node where gitlab-runner is running root, and gitlad-runner must exist in /etc/subuid and /etc/subgid 
    
    echo "Image successfully built"

    # If the image is successfully built, test it
  
    if [ -f "${imagefile}" ]; then

        # test

        echo "Testing the image... Christian!"
        singularity exec $imagefile echo "Ortiz!"

    fi

else

    echo "Singularity recipe ${recipe} not found!"
    exit 1

fi
