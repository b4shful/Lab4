# Lab4
EIE2 IAC Lab4 Group 29

 Please note this repo is private/unlisted and requires your GitHub account to be added to the permitted users list (so no one copies us lol) 

# Task Allocations
## Joel
2. The Register File, ALU and the related MUX.
## Tahni
1. Program Counter and related adders.
## Aisha
3. The Control Unit, the Sign-extension Unit and the instruction memory.
## Luke
4. The testbench and verification of the design working via gtkWave and Vbuddy (where appropriate).

# Cloning
- Make sure you are in ~/Documents/iac directory (cd ~/Documents/iac)
- Run "git clone https://github.com/b4shful/Lab4.git"

# See files to be changed
- Use `git status` to see what files have changed/are staged/unstaged
- Use `git pull` to get any new files on your branch (e.g ones added by someone else on the same branch or on a different PC)

# Branching
We will use "branches" to create new features, this is so no one commits changes to the (ultra sacred) "main" branch
![gitbranch](https://user-images.githubusercontent.com/28313200/202689014-069fd77e-33ff-4a0e-ae4f-93839e2e3509.png)

- To create a branch, use `git branch <branch_name>` (replace <branch_name> with the name of your branch without the brackets, branch names can't have spaces, name your branch after the general task you are trying to do e.g "ALU" or "ProgramCounter"
- To switch to that branch (you will be on "main" by default), do `git checkout <branch_name>`, this will switch to the branch you specified, so all changes will be committed to this branch.

# Stage files to be committed
- Use `git add <file>` or `git add <directory>` (without the brackets) to "stage" files, this adds them to a "stage" or collection of changes which will be added to the next "commit"
    - To add everything you've changed at once, use `git add .`
    
# Commit Changes
- Use `git commit -m "commit message"`
    - Replace "commit message" with something useful describing the changes made in this commit
    - Be specific, you will be using branches for each feature you add, so you can be granular with it and describe (in one line or less) specific work items you did
    
At this point, your changes have been committed to the repository (repo) locally, but they are not reflected on GitHub's servers. We talk about local repository and remote repository. Local is on your machine, remote is on GitHub. We "push" and "pull" to get changes to and from local/remote. 

# Push changes to the remote copy of the branch (the one on GitHub's cloud)
- Once you have committed changes locally, push these to GitHub by doing `git push`
- You can then check online (make sure you look at the correct branch in the branches menu online) and make sure your changes are now reflected online
- https://github.com/b4shful/Lab4 

# Merging your feature branch with main
The final step is to merge your branch with the main branch, therefore adding your changes to the main code.
We do this using a "pull request" which is a feature specific to GitHub.

- Once your branch is up to date on the website, submit a pull request to merge your branch with main. Instructions here:
https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request#creating-the-pull-request

    - GitHub will automatically make sure they are compatible to merge, and that there are no conflicts. If there are conflicts it will detect them and require them to be resolved before you can merge
    
- Pull requests (PRs) need to be approved by one member of the team, you can also add comments/discission under a PR e.g "hey, this will break my code!" and propose changes

- Once approved, the PR is merged and the changes are added to main branch

- Once merged, you should `git checkout main` and delete your just-merged branch with `git branch -d <name>` and `git remote prune origin`

# Pulling remote (online) changes to your remote repo
- Make sure you're in the branch you want to pull from
- Use `git pull`

