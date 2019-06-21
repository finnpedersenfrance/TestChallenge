# Test Challenge

## Git Instructions

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
finnp@DESKTOP-UDF06I0 MINGW64 /c/code/TestChallenge
$ git init
Initialized empty Git repository in C:/code/TestChallenge/.git/
```` 

Notice that it now says `(master)` at the end of the line. It tells you that you are on the master branch. 

Checking the status.
```` 
finnp@DESKTOP-UDF06I0 MINGW64 /c/code/TestChallenge (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore
        App/
        Documentation/
        RapidStart/
        ReadMe.md
        Source/
        app.json

nothing added to commit but untracked files present (use "git add" to track)
````

Adding all the changes.
```` 
finnp@DESKTOP-UDF06I0 MINGW64 /c/code/TestChallenge (master)
$ git add .
warning: LF will be replaced by CRLF in app.json.
The file will have its original line endings in your working directory.
```` 
Making the initial commit of changes.

```` 
finnp@DESKTOP-UDF06I0 MINGW64 /c/code/TestChallenge (master)
$ git commit -m 'initial commit'
[master (root-commit) cc48589] initial commit
 29 files changed, 4868 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 ReadMe.md
 create mode 100644 app.json
```` 

Setting the path to origin. That is, GitHub. I created the repository manually on GitHub and copied the path from the instructions on the site. 

```` 
finnp@DESKTOP-UDF06I0 MINGW64 /c/code/TestChallenge (master)
$ git remote add origin https://github.com/finnpedersenkazes/TestChallenge.git
```` 

Making the first push to GitHub. Notice that the `-u` make it possible to omit the `origin master` and in the future simply to write the command `git push`.

```` 
finnp@DESKTOP-UDF06I0 MINGW64 /c/code/TestChallenge (master)
$ git push -u origin master
Enumerating objects: 34, done.
Counting objects: 100% (34/34), done.
Delta compression using up to 4 threads.
Compressing objects: 100% (33/33), done.
Writing objects: 100% (34/34), 95.21 KiB | 3.97 MiB/s, done.
Total 34 (delta 9), reused 0 (delta 0)
remote: Resolving deltas: 100% (9/9), done.
To https://github.com/finnpedersenkazes/TestChallenge.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.

```` 
