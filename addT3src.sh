#!/bin/bash
TYPO3_VERSION=$1

TYPO3_FILENAME="${TYPO3_VERSION}"
DOWNLOAD_LINK="https://get.typo3.org/${TYPO3_FILENAME}"

echo "Downloading ${TYPO3_FILENAME} ..."
if wget $DOWNLOAD_LINK
then
	echo "Extracting ${TYPO3_FILENAME} ..."
	tar -xzf $TYPO3_FILENAME
	mkdir typo3temp

	echo "Creating symlinks ..."
	ln -s typo3_src-$TYPO3_VERSION typo3_src
	ln -s typo3_src/typo3 typo3
	ln -s typo3_src/index.php index.php

	echo "Cleaning up ..."
	rm typo3_src-$TYPO3_VERSION/_.htaccess
	rm $TYPO3_FILENAME
	
	echo "Enabling install tool"
	touch typo3conf/ENABLE_INSTALL_TOOL
	
	echo "DONE installing TYPO3v${TYPO3_VERSION}"
else
	echo "Error downloading ${DOWNLOAD_LINK}"
fi
