zsh Dotfiles
===================

Install
-------

    curl -L https://raw.github.com/mattnichols/dotfiles/master/tools/install.sh | sh


Track mattnichols/dotfiles
-------------------------

One time:

    git remote add upstream git@github.com:mattnichols/dotfiles.git
    git fetch upstream
    git checkout -b upstream upstream/master

Update
------

Each time you want to update:

    git checkout upstream
    git pull
    git checkout master
    git rebase upstream
