# GitPush-Automated-Github-Push-for-MacOS
Details the steps I took to have my computer automatically push my local files to a github repo whenever I change them through an IDE, etc in order to capture all major changes.

Date: 2017-06-28

Author: Connor Lenio

Dependencies: Automator, fswatch

## Instructions
Complete the following steps if you would like the same function on your Mac:

1) Install fswatch
    * https://github.com/emcrisostomo/fswatch
    * I used Homebrew to install fswatch with:
      ```
      Homebrew
      $ brew install fswatch
      ```

2) Create a bash script using a text editor or IDE that runs the git update code. Feel free to make a custom commit message.
    * Feel free to clone or recreate savePush.sh from this repo:
    ```
    #!/bin/bash
    git add .
    git commit -m "Scripted auto-commit for change made on `date +%b%t%d,%t%Y` at `date +%T`"
    git push
    ```
    
3) Create an app for your script and wrap it as an Application using MacOS Automator
    * While automator is a headache to use for most things, the simple settings in this case make it easy. And, you can add the script to the dock by saving it as an Application when you are done
    * Use an "Ask For Text" and "Run Shell Script" block to create the same functionality
    * See Automator Settings.png in this repo for the settings I used
    * The important commandline code that will be run is:
    ```
    cd "$f"
	fswatch -0 -orl2 -e "\.git" "$f" | xargs -0 -n1 ~/savePush.sh
  ```
    * Where $f is a stand in for the input path from the "Ask for Text" input
