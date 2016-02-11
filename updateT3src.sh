#!/bin/bash
TYPO3_VERSION=$1

TYPO3_FILENAME="typo3_src-${TYPO3_VERSION}.tar.gz"
DOWNLOAD_LINK="http://prdownloads.sourceforge.net/typo3/${TYPO3_FILENAME}"

echo "Downloading ${TYPO3_FILENAME} ..."
if wget $DOWNLOAD_LINK
then
	echo "Extracting ${TYPO3_FILENAME} ..."
	tar -xzf $TYPO3_FILENAME

	echo "Update symlink ..."
	rm typo3_src
	ln -s typo3_src-$TYPO3_VERSION typo3_src

	echo "Cleaning up ..."
	rm typo3_src-$TYPO3_VERSION/_.htaccess
	rm $TYPO3_FILENAME
	
	echo "Enabling install tool"
	touch typo3conf/ENABLE_INSTALL_TOOL
	
	echo "DONE updating TYPO3v${TYPO3_VERSION}"
else
	echo "Error downloading ${DOWNLOAD_LINK}"
fi
