# Test Challenge

The idea behind the Test Challenge is to learn about how to write better tests and functions in Microsoft Dynamics NAV and Microsoft Dynamics 365 Business Central. 

This project is inspired by the book Automated Testing in Microsoft Dynamics 365 Business Central written by Luc van Vugt.

I hope that more NAV and BC developers will start writing Automated Tests for their solutions. 

Finn Pedersen

## How to contribute
The best way to contribute is to Fork this project and add more challenges. 
I suggest that you add a new codeunit. The next in line. Test Challenge 02 for example. 
Put both your tests and the functions into the same codeunit. Just to make it simpler. 
Then make a Pull Request to get them added to the project. 

## Git Instructions
If you are new to Github, then here are some typical instructions. 

### Before making any changes
Before starting to make changes, make sure that you start on a new branch. These are the steps you need to follow. 

- `git checkout -b name-of-new-branch` (create and change to a new branch)
- make your changes
- `git status` (check the status of your changes)
- `git add .` (add all changes to the following commit)
- `git commit -m 'description of changes'` (commit your changes to the branch with a mandatory message)
- `git push origin name-of-new-branch` (push your changes to the branch on GitHub)
- `git checkout master` (then switch to the master branch)
- `git pull origin master` (then pull your latest changes back to your master branch from GitHub)

You are now back on the master branch and ready to start all over with the next change. 

### The Initial Git Instructions

Initializing the repository.

```` 
$ git init
```` 

Notice that it now says `(master)` at the end of the line. It tells you that you are on the master branch. 

Checking the status.
```` 
$ git status

````

Adding all the changes.
```` 
$ git add .
```` 
Making the initial commit of changes.

```` 
$ git commit -m 'initial commit'
```` 

Setting the path to origin. That is, GitHub. I created the repository manually on GitHub and copied the path from the instructions on the site. 

```` 
$ git remote add origin https://github.com/finnpedersenkazes/TestChallenge.git
```` 

Making the first push to GitHub. Notice that the `-u` make it possible to omit the `origin master` and in the future simply to write the command `git push`.

```` 
$ git push -u origin master
```` 
