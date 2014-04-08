#Git and Github
_____________________

![git does not equal github](http://1.bp.blogspot.com/-WY2YpNr3W6g/UY6tZAc-H3I/AAAAAAAABLY/xJ9x3wIY8V8/s440/Github2.png)  

###Git Commands Cheatsheet

- `git init`  initializes a git repository

#####Saving Changes

- `git add <filename>` adds a file or changes in a file to a repository
- `git add .` adds everything in current directory (files and changes) to a repository
- `git commit -m <meassage>` saves changes you've made to the repository

#####Reverting Changes

- `git reset <Log Number>` resets git repo to specific commit 
- `git reset --hard <Log Number>` reset git repo, and current directory to specific commit

- `git commit --amend` Adds changes to previous commit
- `git commit --amend -m "New message"` changes your previous commit message

#####Working with Remotes

- `git remote add <remote_name> <url>` connects repo to a remote url (usually github)
- `git remote rm <remote_name>` removes a previously added remote
- `git remote -v` lists all of your remotes

- `git push <remote_name> <branch>` pushes changes to a remote git repo (usually github)
- `git fetch <remote_name> <branch>` fetches change from a remote, but does not merge into local repo
- `git pull <remote_name> <branch>` pulls and merges changes from a remote git repo (usually github)

- `git clone <url>` copy's a repo from github

#####Working with Branches

- `git branch` lists different branches
- `git branch <new_branch_name>` creates a new branch
- `git checkout <branch_name>` moves you to the branch specified
- `git checkout -b <new_branch_name>` creates a new branch, and moves you to new branch

- `git merge <branch_name>` merges the specified branch into the working branch

#####Helpful Commands

- `git help` lists possible git commands
- `git status` shows changes that have not been committed
- `git log` shows commit history
- `git diff` show changes between commits, commit and working tree, etc

- `git config --global user.name "John Doe"` sets a name that will be attached to commits
- `git config --global user.email johndoe@example.com` sets an email that will be attached to commits

###Baisc Git Workflow

**Step 1:** Create a new directory `mkdir new_directory`  
  *Note: A directory is not the same as a repository* 

**Step 2:** Move into your new directory `cd new_directory`  

**Step 3:** Initialize a new repository `git init`  


**Step 4:** Write some code and Add changes to staging `git add .`  

**Step 5:** Commit changes to repo `git commit -m "My changes"`  

**Step 6:** Repeat **steps 4 and** 5  

**Step 7:** Create a repo on Github

**Step 8:** Connect your Github Repo to your local repo `git remote add origin git@github.com:user_name/my_repo.git`  

**Step 9:** Push your local repo to Github `git push origin master`  

**Step 10:** Continue to add, commit, and push changes
  `git add .`  
  `git commit -m "new message"`  
  `git push origin master`  

![git_workflow](http://thkoch2001.github.io/whygitisbetter/images/local-remote.png)


###Working with Github

####How to Create a Repo

1. Click "New Repo"

  ![new_repo_button](https://github-images.s3.amazonaws.com/help/bootcamp/bootcamp_2_newrepo.jpg)

2. Fill out the information on this page. When you're done, click "Create Repository."

  ![create_repo_page](https://github-images.s3.amazonaws.com/help/bootcamp/bootcamp_2_repoinfo.png)

3. Congratulations! You have successfully created a repository!

####How to Create a Pull Request on Github

*Before you can open a pull request, you must create a branch in your local repository, commit to it, and push the branch to a repository or fork on GitHub.*  

1. Visit the repository you pushed to
2. Click "Compare and Review" in the repository
3. You'll land right onto the compare page. *(You can click Edit at the top to pick a new branch to merge in, using the Head Branch dropdown)*  
4. Select the target branch your branch should be merged to, using the Base Branch dropdown
5. Review your proposed changes.
6. Click "Click to create a pull request" for this comparison
7. Enter a title and description for your pull request
8. Click Send pull request

###Resources

Jackie's Slides: https://docs.google.com/a/generalassemb.ly/presentation/d/1aBjy-0ihgKOqcaxRrE4RHVJPVwQAFqYzc2_gtc6IPGU/edit#slide=id.g26a076831_036  
Official Documentation: http://git-scm.com/doc  
Try Git Tutorial: http://try.github.io/levels/1/challenges/1  
Git Hug game: https://github.com/Gazler/githug  
Other Resources: http://training.github.com/resources  

Setting up SSH Keys: https://help.github.com/articles/generating-ssh-keys  
General Github Help: https://help.github.com/  

