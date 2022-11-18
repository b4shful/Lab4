# Lab4
EIE2 IAC Lab4 Group 29

 Please note this repo is private/unlisted and requires your GitHub account to be added to the permitted users list (so no one copies us lol) 

# Cloning
- Make sure you are in ~/Documents/iac directory (cd ~/Documents/iac)
- Run "git clone https://github.com/b4shful/Lab4.git"

# See files to be changed
- Use `git status` to see what files have changed/are staged/unstaged
- Use `git pull` to get any new files on your branch (e.g ones added by someone else on the same branch or on a different PC)

# Stage files to be committed
- Use `git add <file>` or `git add <directory>` (without the brackets) to "stage" files, this adds them to a "stage" or collection of changes which will be added to the next "commit"
    - To add everything you've changed at once, use `git add .`
    
# Commit Changes
- Use `git commit -m "commit message"`
    - Replace "commit message" with something useful describing the changes made in this commit
    - Be specific, you will be using branches for each feature you add, so you can be granular with it and describe (in one line or less) specific work items you did
    
At this point, your changes have been committed to the repository (repo) locally, but they are not reflected on GitHub's servers. We talk about local repository and remote repository. Local is on your machine, remote is on GitHub. We "push" and "pull" to get changes to and from local/remote. 

