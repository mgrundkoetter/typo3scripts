# TYPO3 helper scripts.
Some helper scripts for adding/upgrading TYPO3 source files.

If you have project files in a directory and only need the CMS source files to be added, use the *addT3src.sh* script.
You can add all required TYPO3 source files and symlinks by using the script and adding the desired TYPO3 version as parameter:

    wget --no-check-certificate https://raw.githubusercontent.com/mgrundkoetter/typo3scripts/master/addT3src.sh
    chmod +x ./addT3src.sh
    ./addT3src.sh 7.6.21

If you already have a running TYPO3 version and just want to upgrade the CMS source files to a newer version, use the *updateT3src.sh* script. It will reset the symlinks to the new version which you can also set via parameter:

    wget --no-check-certificate https://raw.githubusercontent.com/mgrundkoetter/typo3scripts/master/updateT3src.sh
    chmod +x ./updateT3src.sh
    ./updateT3src.sh 7.6.21
  
Keep in mind, that any required further steps will have to be done manually! A good start is to call the install tool afterwards, run the upgrade wizard and maybe also a database compare to be sure everything will work again.
