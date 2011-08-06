# My vimrc files

See below for installation and bundle managment.

See file commands.md for handy commands and
a description of the installed plugins.

# Installation

## Backup old files

    mv .vim .vim_old
    mv .vimrc .vimrc_old

## Clone

    git clone git@github.com:jlmaccal/vimrc.git .vim

## Symlink vimrc

    ln -s .vimrc/vimrc_root .vimrc

## Install Vundle

    cd ~/.vim
    mkdir bundle
    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

## Update installed bundles

    vim
    :BundleInstall!

## Compile Command-T Extension

    cd ~/.vim/bundle/Command-T
    rake make

# Managing Bundles

I use the Vundle package for managing bundles. See :h vundle for detailed help.

## Update Packages

    :BundleInstall!

## Add Packages

    Add Bundle 'git_hub/path' to .vimrc
    :BundleInstall

## Remove Packages

    Remove Bundle line from .vimrc
    :BundleClean

