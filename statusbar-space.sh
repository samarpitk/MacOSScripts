#!/bin/bash

# Check if the user provided an input
if [ -z "$1" ]; then
  echo "Usage: $0 <size>"
  exit 1
fi

# Assign the input to the size variable
spacing=$1

# Calculate the division
padding=$((spacing / 3))

# Run the command with the provided spacing and adjusted padding
defaults -currentHost write -globalDomain NSStatusItemSpacing -int $spacing
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int $padding

# Restart the cfprefsd and SystemUIServer to apply the changes
killall -u $USER cfprefsd && killall SystemUIServer

echo "NSStatusItemSpacing set to $spacing"
echo "NSStatusItemSelectionPadding set to $padding"