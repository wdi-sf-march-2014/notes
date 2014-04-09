![GA_Logo](https://raw.github.com/generalassembly/ga-ruby-on-rails-for-devs/master/images/ga.png)

#WDI Installfest 


We are going to install the tools necessarily to program with Ruby and Rails on your computer.

If you are on a Mac which is not running the latest version of OSX, please upgrade through the Mac App Store.  Apple has made it easier to set up a computer for software development in OSX Mavericks, and keeping the differences between computers to a minimum will help us get everything installed quickly and correctly.

If you are unsure or run into problems during installation, stop and don't worry; We will finish up any of the loose ends on Installfest.  Do not try to troubleshoot on your own, you might break your environment further.   

##Verify your install
If you have already experimented with ruby or rails before, verify your versions are correct for this upcoming class.

If you can see the correct version numbers when you run the commands in Terminal below, you are good to go.

**Verify you are running 2.0 of Ruby**

`ruby -v`

**Verify you are running version 4 of Rails**

`rails -v`

If not, continue with the instructions to get your envionment going. Run these again after you're done to ensure everything is working properly.

---
---


#Mac Instructions
* Install Xcode or Command Line Tools
* Install Homebrew (Software Package Manager for Mac)
* Install GIT
* Install RVM and Rails
	

##Install Command Line Tools
If you are running Mavericks, you don't have to install Xcode in order to get command line tools.

In your terminal type `xcode-select --install` and a new window and installer will appear. 


##Xcode
If you are not running Mavericks, you will need to install Command Line tools that come from Xcode.


*	Create an account on Mac App Store if you haven't already.
*	Upgrade your OS to the latest version possible using the Mac App Store (Maverick is the latest version) - The cost of Mountain Lion is around $20, most people will already have it, but if you can upgrade, you should!
*	Open the Mac App Store and install Xcode
*	Open Xcode, Choose Preferences, Downloads and then Install The Command Line Tools




##Install Homebrew

###Homebrew
[http://brew.sh/](http://brew.sh/)

Homebrew is a package manager, a program which will install other programs that we need.  Open up the application Terminal and run the command below to install Homebrew

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

![image](https://gist.github.com/rsofaer/7952112/raw/8ff1c256423b38431e938088c5b187b588c9d5bd/install_brew.png)

###Brew Doctor
Run brew doctor in your Terminal to let you know if the install was successful. It will give you tips on what you can do to corrrect any system wide issues. If you do have any problems, 
```
brew doctor
```

- See what the Doctor says.  You may need to edit your ~/.bashrc
```
echo 'export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"' >> ~/.bash_profile
```
That means "Append the string 'export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH' to the file ~/.bash_profile."

## Git

Sign up for an account on [http://www.github.com](http://www.github.com). We will be using github.com for storing and sharing code.


###Install git
```
brew install git
```


###Update git config information
You'll want to configure your git settings to make your commit show up nicely on Github.com.  The email address you put in should be the same one that you used for your Github account.

```
git config --global user.name "YOUR-USERNAME"
git config --global user.email YOUR-EMAIL-ADDRESS
```


##RVM and Ruby
RVM stands for Ruby Version Manager. It lets you easily switch between Ruby versions.

###Install RVM with Ruby

[http://www.rvm.io](http://www.rvm.io) for full instructions


Running the following command will install the latest version of Ruby as well as the RVM envionment into your session.

```
\curl -L https://get.rvm.io | bash -s stable --ruby --rails
```

![image](https://gist.github.com/rsofaer/7952112/raw/55bd869e91f7207dfbcf484621e26631eff1b109/install_rvm.png)

After installing `rvm`, restart your terminal.  Try typing `rvm` into terminal.  You should see a help message.  If you don't, stop and get an instructor.


##Rails

###Install Rails 4
After you have installed ruby, we will make sure that Rails 4 is installed.

Type `rails -v`.  You should see something like: `Rails 4.0.2`.

If not, be sure you restarted your terminal, make sure that rvm is working, and make sure that `rvm list` shows that a version of ruby is installed.

If all that looks good, install rails with the following command:
```
gem install rails
```

Do NOT run `sudo gem` anything, even if an error message tells you to do so.

## Sublime Text 2

Our main text editor will be Sublime Text 2, which can be downloaded from the Sublime Text website:

[http://www.sublimetext.com/2](http://www.sublimetext.com/2)

`sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/subl`

---
---



#Ubuntu Instructions 



##apt-get

###Install apt-get
```
sudo apt-get install curl
```

##rvm & ruby

###Install RVM
```
\curl -L https://get.rvm.io | bash -s stable --ruby --rails
```


###Login Shell preference
- In terminal go to `Edit -> Profile Preferences`
- Under `Title and Command` check `Run command as a login shell`
- Close preferences and restart terminal



##rails

###Install Rails

Type `rails -v`.  If you don't see something like `Rails 4.x.y`, where x and y are numbers, then type `gem install rails`

##git

###Install git
```
sudo apt-get install git-core
```

###Update git config information

```
git config --global user.name "YOUR-USERNAME"
git config --global user.email YOUR-EMAIL-ADDRESS
```

## Sublime Text 2

Our main text editor will be Sublime Text 2, which can be downloaded from the Sublime Text website:

[http://www.sublimetext.com/2](http://www.sublimetext.com/2)

`sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /bin/subl`

---
---
#Windows Users

We recommend that you install a Linux distribution like Ubuntu on your computer and boot into Linux.
