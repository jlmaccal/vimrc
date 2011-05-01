# Fun things to do with vim

This document describes some fun things you can do with vim and this vimrc file
and related plugins.

## General

jj                  Type quickly to exit insert mode. (Like pressing <esc>, but easier)
<return>            Type in normal mode to add a newline. Same as o<esc>


## Command buffers
q:                  Open command buffer
q/                  Open search buffer
<C-f>               Open command line in command buffer


## vimrc file

,v                  Load vimrc for editing
,V                  Source vimrc file


## Splits

<ctrl-w> v          Create a vertical split
<ctrl-w> s          Create a horizontal split
<ctrl-w> hjkl       Move between splits (vim default)

<ctrl-h>
<ctrl-j>
<ctrl-k>            Move between splits
<ctrl-l>

:q                  Close split
:close              Close current split
<ctrl-w> o          Make this the only open window
<ctrl-w> HJKL       Move splits
<ctrl-w> lrLR       Rotate windows
<ctrl-w> =          Set all windows to same size
<ctrl-w> +-<>       Change the size of current window


## Files Buffers

:bp                 Previous buffer
:bn                 Next buffer
:buffers            List buffers
:b n                Switch to buffer n
:ball               Open all buffers into split
:sb name            Change to buffer name
### Buffer Explorer
,ll                 Open buffer explorer
<enter>             Open buffer under cursor
d                   Delete buffer under cursor
### LustyJuggler
,lj                 Start lusty explorer
as..kl              Press to select buffer. Press again to confirm.
### LustyExplorer
,lf                 Start filesystem explorer
,lr                 Open explorer at directory of the current file
,lb                 Open buffer explorer
,lg                 Open buffer grep
<C-n>               Select next match
<C-p>               Select previous match
<C-w>               Ascend one directory
### Command-T
,t                  Start command-t file opener
                    Now type characters from the path/filename
<enter>             Open the selected file
<C-s>               Open the selected file in split
<C-v>               Open the selected file in a vertical split
<C-t>               Open the selected file in a new tab
<C-j> or <down>     Next file in listing
<C-k> or <up>       Previous file in listing


## Motion Commands
,w                  Camel case forward
,b                  Camel case backwards
,e                  Camel case to end of word
g;                  Move cursor back to last edit. Hit again to move
                    to previous edit.
g,                  Move forward through changelist
:changes            View changelist
}{                  Jump to next/previous paragraph
)(                  Jump to next/previous sentence
H                   Move to top of page
M                   Move to middle of page
L                   Move to bottom of page
<c-o>               Move back through jump list
<c-i>               Move forward through jump list
:jumps              View jump history

## Commenting
,c<space>           Toggle comments on the selected lines
,cu                 Uncomment selected lines
,cc                 Comment selected iines
,ci                 Toggle state of comments individually
,cy                 Yank selected lines, then comment


## Python help
,pw                 Search for python help on module under cursor
,pW                 Search python help for word under cursor

## Relative numbering
,rn                 Turn on relative numbering
,rN                 Turn off relative numbering

