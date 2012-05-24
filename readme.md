# My vimrc files

Requires python and ruby support to be installed in vim. I recommend installing
by [homebrew][brew].

See below for installation and bundle managment.

See file commands.md for handy commands and a description of the installed plugins.

[brew]: http://mxcl.github.com/homebrew/

# Installation

## Backup old files

    mv .vim .vim_old
    mv .vimrc .vimrc_old

## Clone

I use a tool called [homesick][hs] to manage my dotfiles. This tool uses
git to manage your dot files and symlinks them into the appropriate place.

    homesick clone jlmaccal/vimrc

Actually, you should probably fork this on github and then clone your own version.

[hs]: https://github.com/technicalpickles/homesick

## Symlink vimrc

Run this command to symlink the files into your home directory.

    homesick symlink jlmaccal/vimrc

## Install Vundle

I use the Vundle pacakage manager for vim.

    cd ~/.vim
    mkdir bundle
    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

## Update installed bundles

    vim
    :BundleInstall

# Managing Bundles

I use the Vundle package for managing bundles. See :h vundle for detailed help.

## Update Packages

    :BundleInstall!

## Add Packages

    Add Bundle 'git_hub/path' to .vimrc
    :BundleInstall

## Remove Packages

    Remove Bundle line from .vimrc
    :BundleClean!

# Updating repos

The git repos are stored in ~/.homesick/repos. Go hear and use any normal git command
to manage the repository.

