#!/bin/bash

# Assuming students follow directions, this:
#   1) Finds all the Zip files which exist and are named in the following manner: 
#     STUFF_$NETID_MORESTUFF.zip
#   2) Extracts the Zip archive to a folder named $NETID
#   3) Copies the Haskell files (.hs) to a directory named "final" after
#         smashing (removing spaces) from the filename

rm -r final/; mkdir final; ls -1 *.zip | cut -d _ -f 2 | xargs -I NETID sh -c "unzip -oq *NETID*.zip -d NETID; find NETID -name '*.hs' -and -not -name '.*.hs' -exec sh -c \"echo {} | rev | cut -d \/ -f1 | rev | tr -d ' ' | xargs -I TRUNC cp '{}' final/NETID_TRUNC \" \;";

