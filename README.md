# typo3scripts
Some helper scripts for TYPO3

If you have project files in a directory and only need the CMS source files to be added, use the *addT3src.sh* script.
You can add all required TYPO3 source files and symlinks by using the script and adding the desired TYPO3 version as parameter:

    ./addT3src.sh 7.6.2

If you already have a running TYPO3 version and just want to upgrade the CMS source files to a newer version, use the *updateT3src.sh* script. It will reset the symlinks to the new version which you can also set via parameter:

    ./updateT3src.sh 7.6.2
  
Keep in mind, that any required further steps will have to be done manually! A good start is to call the install tool afterwards, run the upgrade wizard and maybe also a database compare to be sure everything will work again.
