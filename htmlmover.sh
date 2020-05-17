#!/bin/bash

echo "Copying HTML to HTML directory."

oldassets=/var/www/html/assets
oldindex=/var/www/html/index.html

if [ -d "$oldassets" ]; then
  echo "ASSETS DIRECTORY:$oldassets EXISTS!"
  echo "ATTEMPTING TO REMOVE $oldassets"
  { # try
    sudo rm -rv /var/www/html/assets
  } || { # catch
    echo "ISSUE REMOVING $oldassets!"
    echo "PLEASE CHECK THIS DIRECTORY MANUALLY!"
  }
fi

if test -f "$oldindex"; then
  echo "index.html EXISTS!"
  echo "ATTEMPTING TO REMOVE $oldindex"
  { # try`
    sudo rm -v /var/www/html/index.html
  } || { # catch
    echo "ISSUE REMOVING $oldindex!"
    echo "PLEASE CHECK INDEX FILE MANUALLY!"
  }
fi

echo "ATTEMPTING COPY OF ASSETS"
{ # try
  sudo cp -r web/assets /var/www/html
  echo "NEW assets COPY SUCCESSFUL!"
} || { # catch
  echo "assets COPY FAILED!"
  echo "PLEASE CHECK AND COPY DIRECTORIES MANUALLY!"
}

echo "ATTEMPTING COPY OF index.html"
{ # try
  sudo cp index.html /var/www/html &&
  echo "NEW index.html COPY SUCCESSFUL!"
} || { # catch
  echo "index.html COPY FAILED!"
  echo "PLEASE CHECK AND COPY INDEX MANUALLY!"
}

echo "CURRENT CONTENTS OF YOUR /VAR/WWW/HTML DIRECTORY:" ls -la /var/www/html
