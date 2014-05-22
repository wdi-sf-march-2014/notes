#Git Branching + Group Workflow

##Learning Objectives
- create a git branch
- move between branches
- merge two branches
- overcome merge conflicts
- send a pull request from a branch
- rebase
- define work flow

##General Notes

###Creating a Branch

There are two ways to create a branch in git.  

**Option 1:**  
  `git branch <new_branch>` creates a new branch  
  `git checkout <new_branch>` moves you to the new branch  

**Option 2:**  
  `git checkout -b <new_branch>` creates a new branch and moves you to it  

###Moving Between Branches

To move between branches:  
`git checkout <branch_I_want_to_go_to>` moves you to specified branch.  

To list available branches:  
`git branch` will list all branches.  

###Merging Branches

We can combine two branches together by using `git merge`  

Let's say we have a branch **master** and a branch **feature**  

In order to combine the two (from the master branch), we run...  

`git merge feature`  

Instead of using merge we can also use rebase *see below*  

###Merge Conflicts

Git is smart, but not that smart. Merge conflicts occur when the changes between 2 branches overlap, and git is not sure which version you want.  

When you are trying to merge and a conflict arises, your terminal will tell you, and it will look something like this...  

```
Auto-merging test.rb
CONFLICT (content): Merge conflict in test.rb
Automatic merge failed; fix conflicts and then commit the result.
```
The conflicts will also appear in your files with special tags.  

```ruby
<<<<<<< HEAD
puts "Hello"
puts "adkljfdklsajf"
=======
puts "Hi"
puts "More things"
>>>>>>> conflict
```

The first section of the code is from our master branch and the second is the code we are trying to merge in.  

Here you will have to manually select the code you want.  

```ruby
puts "adkljfdklsajf"
puts "Hi"
puts "More things"
```

After you select the code you want to keep you will have to add and commit these changes.  

```
git add .
git commit -m "Fixed conflict"
```
###Merge Tools and Setting Up Kdiff3 - Optional - Done on Own

There are many GUI tools out there to help you deal with merge conflicts. These can be helpful when you have really complex merge issues. One of the highly rated mergetools is called kdiff3. There is also a more fully-fledged git client called sourceforge, http://www.sourcetreeapp.com/  

**You can download kdiff3 here:** http://sourceforge.net/projects/kdiff3/files/  

After you have downloaded kdiff3 you must configure it. To do this run the following commands in your terminal (only for Mac).  

`git config --global merge.tool kdiff3`  
`git config --global mergetool.kdiff3.path /Applications/kdiff3.app/Contents/MacOS/kdiff3`  

To use kdiff3, whenever you run into a merge conflict run `git mergetool` in your terminal. This should open the kdiff3 app.  

###What is a Rebase?

A rebase is different from a merge in that it stacks the changes from one branch on top of another branch. A merge joins all the commits together, and creates a new commit that tracks the merge. A rebase essentially changes our git history, which is pretty cool.  

Besides being awesome, we use rebasing because it keeps our pull requests clean, and our git history in a linear order.  

![merge vs. rebase]("http://git.mikeward.org/img/merge-rebase.png")  

##Suggested Workflow

**Setup**  

**1.** Create a repo on github to serve as the main repo.  
**2.** All other members fork and cloen this repo.  
**3.** Connect your repo to the main repo `git remote add upstream <url>`  
  - You will pull changes from upstream, and push your changes to origin.  

**Using your git repo**  
**1.** Create feature branch `git checkout -b <branch_name>`  
  - Never, ever make new features from your master branch.  
**2.** Do work.  
**3.** add + commit `git add .`, `git commit -m "did things"`  
**4.** Pull in any new changes from the master repo  
  - `git pull --rebase upstream master`  
**5.** Deal with merge conflicts and continue `git rebase --continue`  
  - add and commit merge *(only done if conflicts exist)*  
**6.** Push to your own github repo  
  - `git push origin feature_branch`  
**7.** Sumit pull request into master repo  
**8.** Have another member review and merge your code.  
**9.** Update your master branch to reflect new code.  
  - From master branch `git pull --rebase upstream master`, `git push origin master`  
**10.** Repeat.  

##Code Along

**Merge non-conflicting branch**  

`git checkout -b feature`  

test.rb
```ruby
puts "Hello World"
```

`git checkout master`  
`git merge feature`  
`git branch -d feature`  

**Merge branch with conflict**  

`git branch new_feature`  

```ruby
puts "Hello World"
puts "My name is Jackie"
```

`git checkout new_feature`  

```ruby
puts "Hello World"
puts "#yoloswag420!"
```

`git add .`  
`git commit -m "conflict"`  

`git checkout master`  
`git merge new_feature`  

Deal with merge conflicts  

`git add .`  
`git commit -m "merged"`  
`git branch -d new_feature`  

**Using rebase**  

First we will create a new branch `git checkout -b new_feature`  

Now we will add some changes to test.rb  

```ruby
puts 2 + 2
```

Now I will add a different change on master and push these to github.  

Together we will add a new remote.  

`git remote add upstream <url>`  

Next we will pull and rebase our new remote's master branch into our feature branch.  

`git pull --rebase upstream master`  

Finally, we will push to our feature branch on github and submit a Pull Request.  

`git push origin new_feature`  

Last but not least, we will merge in the pull request and update our master branch.  
It is **extremely** important that you always try to keep your master branch up to date.  

`git checkout master`  
`git pull --rebase upstream master`  

When working with groups **DO NOT** merge branches locally into master. You want to ensure that your master branch always is reflective of the groups master branch.  

##Exercises

###Exercise 1 - Individual

**1.** Create 3 new branches (make sure you branch all of these off of master).  
**2.** Add different changes to each branch.  
**3.** Move back to master and merge in each of these branches, dealing with merge conflicts as you go.  

###Exercise 2 - Individual

**1.** From your master branch add a change, commit it, and push it to github.  
**2.** Move back to your feature branch and add a new file.  
**3.** Add and commit this change.  
**4.** Pull and rebase your master branch from github.  
**5.** Run `git log` in your terminal and look at the commit history.  

###Exercise 3 - Group

**Do this exercise in your project groups.**  

**1.** Student 1 should start a new rails app and push it to their github.  
**2.** Students 2-3 should fork and clone this repo.  
**3.** Students 2-3 should add a new remote, "upstream", that connects to the original github repo.  
**4.** Student 1 (from the master branch) will add a change to the README file, and push this change to github.  
**5.** Students 2-3 will individually create feture branches, and commit these changes.  
**6.** Students 2-3 will pull and rebase upstream master, dealing with any merge conflicts in the process.  
**7.** Students 2-3 will push to github and submit a pull request.  
**8.** Student 1 will merge in a pull request, and then update their master branch.  

###Resources

**Funny Video:** https://www.youtube.com/watch?v=CDeG4S-mJts  
**What is a Git Branch (has good diagrams):** http://git-scm.com/book/en/Git-Branching-What-a-Branch-Is  