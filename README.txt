*******************************************************
          H O W - T O   U S E   G I T U P D A T E
*******************************************************
1) The script takes two command-line arguments:
        a) Branch name - master, <UID>_user_branch, etc.
        b) Comment - Comment submitted while pushing new files to the GIT project.

2) You must have the script at the parent directory where you mount all your projects. Make sure you run the script from the project directory, and not the parent directory. For example, you are working on xyz-client project that you've clone to your local machine, do: cd xyz-client/ , and then run the script.

NOTE: Add the path to the script in your %PATH% environment variable on your Linux machine. That way, you can directly use the script from any directory, without having to give an absolute path to it. Insert the following export in your .bash_profile file using "vim ~/.bash_profile" command:

        export PATH=<absolute_path_to_your_gitupdate_script>:$PATH

3) The script must be run in the following way (please note: the sequence of options is not important):
        gitupdate [ -b BRANCH ] [ -c COMMENT ]

   For e.g., gitupdate -b "master" -c "Updated deployment YAML"
