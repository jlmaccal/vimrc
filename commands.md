# vim: set tw=80:

# Vim Keyboard Shortcuts

This document describes some fun things you can do with vim and this vimrc file
and related plugins.

## General

    jj                  Type quickly to exit insert mode. (Like pressing <esc>,
                        but easier)
    <return>            Type in normal mode to add a newline. Same as o<esc>

## Searching

    /                   Search forwards
    *                   Search for word under cursor
    #                   Reverse search for word under cursor
    n                   Next search match
    N                   Previous search match
    ,/                  Hide search highlighting

Also see Ack, below.

## vimrc file

    ,v                  Load vimrc for editing
    ,V                  Reload (source) vimrc file

## Splits

    <ctrl-w> v          Create a vertical split
    <ctrl-w> s          Create a horizontal split
    <ctrl-w> hjkl       Move between splits (vim default)
    <ctrl> + hjkl       Move between splits using control key            
    <ctrl-w><ctrl-w>    Hop between two splits

    ,bw                 Close split
    <ctrl-w> o          Make this the only open window
    <ctrl-w> HJKL       Move splits
    <ctrl-w> lrLR       Rotate windows
    <ctrl-w> =          Set all windows to same size
    <ctrl-w> +-         Change the size of current window


## Files Buffers

    ,p                  Previous buffer (also left arrow)
    ,n                  Next buffer (also right arrow)

## Motion Commands

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
    gv                  Reselect previously selected visual mode text

## Scrolling

    <ctrl-f>            Forward one screen
    <ctrl-b>            Back one screen
    <ctrl-d>            Forward half a screen
    <ctrl-u>            Back half a screen
    zt                  Move current line to top of screen
    zz                  Move current line to middle of screen
    zb                  Move current line to bottom of screen
    H/M/L               Move cursor to top/middle/bottom of screen


## vimdiff

    do                  Copy changes from the other window to this window
    dp                  Put changes from this window into ohter window
    ]c                  Jump to the next change
    [c                  Jump to the previous change
    :vimupdate          Update diff highlighting

## Folding

All folding commands begin with 'z' because it looks like a folded piece of
paper. Folds are treated as a single line for the purposes of deleting and yanking.

    zo                  Open a fold
    zO                  Open a fold recursively
    zc                  Close a fold
    zC                  Close a fold recursively
    za                  Toggle fold level
    zj/zk               Move between folds
    [z/]z               Move between start and end of fold
    zr/zm               Reduce or more the current fold level
    zR/zM               Unfold / Fold all folds

## Using Markers

    mx                  Mark the current position as x. Works for all letters
                        [a-z].
    'x                  Go to the line marked by x
    `x                  Go to the character marked by x
    ``                  Return to the exact position before previous jump.
                        <Ctrl-o> also works for this.
    ''                  Return to previous line

# Vim plugins

## Ack

    :Ack string         Search recursively for string in the current working
                        directory. Opens a quick fix window below. Use :cd dir
                        to change to a different directory, or ,cd to change to
                        the directory containing the current file.
    o / Enter           Open the selected line
    go                  Preview. Opens selected line but keeps focus on quickfix
                        window.
    q                   Close the quickfix window.
    ,n                  Go to next occurance
    ,p                  Go to previous occurance

For more:

    :h Ack


## Fugitive

    :Gstatus            Interactive status window.
    ctrl-n / ctrl-p     Move between fiels
    -                   Stage / unstage a file
    <CR>                Open file under cursor
    p                   Begin selecting patches
    enter               Open file under cursor
    shift-C             Open commmit window
    :Gdiff              Run vimdiff between working copy and index
    :diffupdate         Re-color diff
    :diffget / diffput  Get or put changed lines
    :diffget buffspec   Pull changes from the buffer identified by buffspec
    [c / ]c             Jump between conflicts
    dp                  Put change from branch into working copy
    :Gedit              Open a file from any branch in a read-only buffer
    :Gedit branchname:path/to/file
    :Glog               examine all previous revisions of current file and 
                        queue them in the quick fix window
    :Gedit              with no arguments will reload the working directory
                        version of the current file.
    :Glog --            Load a list of commit records into the quick fix window.
    :Glog -- %          Load commit objects that touched the current file.
    :Extradite          Pull up visual commit browser for current file.
    :Gwrite             Save current file and stage to index.
    :Gread              Revert current file to version from repo.
    :Gcommit            Open commit window
    :Git command        Run git command
    :Gblame             Run git blame command on current file

Staging hunks with fugitive:

    :Gdiff              Bring up diff
    :Gread / Gwrite     Reconcile index with working copy
    :diffget / diffput
    :w                  Save modified files and just hunks with be staged
    :diffupdate         Update the diff highlighting
    do                  diff obtain
    dp                  diff put


For more:

    :h fugitive


## Lusty

Lusty explorer uses fuzzy matching to open files and buffers.

    ,lf                 Start filesystem explorer
    ,lr                 Open explorer at directory of the current file
    ,lb                 Open buffer explorer
    ,lg                 Open buffer grep
                        This will grep within all currently open buffers.
    <C-n>               Select next match
    <C-p>               Select previous match
    <C-w>               Ascend one directory
    ,lj                 Open lusty juggler.  Press home row key to select
                        buffer. Press again to open file.


For more:

    vim ~/.vim/bundles/lusty/doc/


## Command-T

Command-T is a plugin for opening files based on a fuzzy matching algorithm. It
is similar to the Command-T option in TextMate or Launchbar.

Basically, press ,t and then start typing characters from the file until you
narrow it down to the one you want. Then hit enter to open it.

    ,ff                 Start command-t file opener
                        Now type characters from the path/filename
                        ff = fuzzy find
    ,fb                 Same but for buffers. fb = fuzzy buffer
    <enter>             Open the selected file
    <C-s>               Open the selected file in split
    <C-v>               Open the selected file in a vertical split
    <C-t>               Open the selected file in a new tab
    <C-j> or <down>     Next file in listing
    <C-k> or <up>       Previous file in listing


For more:

    :h command-t


## EasyMotion

Easy motion adds some awesome movement commands. These commands find matching
locations in the file and then overlay a letter onto each one. You then press
the corresponding letter to move to that location.

They all begin with ,m followed by a motion command:

    ,mj                 Move down
    ,mk                 Move up
    ,mf                 Find character
    ,mF                 Find character reverse
    ,mw                 Move to word
    ,mb                 Move to word backwords


For more:

    :h easymotion


## NERDCommenter

    ,c<space>           Toggle comments on the selected lines. Works with visual
                        mode.
    ,cy                 Yank selected lines, then comment. Press p to paste the
                        yanked lines. Really useful for commenting out an existing 
                        line and modifying it.


For more:

    :h NERDCommenter


## SuperTab

Let's you do insert completion using the tab key.

Hit tab or s-tab to complete. Keep hitting to cycle. Press ctrl-y to
select.


For more:

    :h supertab


## vim-surround

Plugin to add "surroundings" to text. I.e. braces, parenthesis, quotes, etc.
These commands require an additional specification of what surrounding to use.

    ds - delete surroundings
    cs - change surroundings
    ys - add surrounding
    yss - surround current line
    yS, ySS - indent text and place it on own line
    v...S - add from visual (this seems broken on my machine)

Examples ( | indicates the cursor position ):

    (blah| blah blah)   press ds( to remove the parens.      
    (blah| blah blah)   press cs([ to change the parens to square brackets.
     blah blah blah     (all selected in visual mode). S( to surround in parens.

When you specify which parens to add, there are two behaviors. If you choose the
opening parens, the surrounded text will be padded with spaces. If you choose
the closing parens, there will be no spaces.


For more:

    :h surround


## Tagbar

Press ,tt to open tagbar. This will produce a list of all symbols in the current
source file. Select a symbol and press o or enter to jump to that location.
Press ctrl-o and ctrl-i to navigate back and forth. Press q or ,tt to close
the tagbar.


For more:

    :h tagbar


## Gundo

Press ,uu to activate Gundo. This will show a window with the editing history of
your file. Use j/k to move up and down. The diff window below will show the
changes of each version. Press p to show a diff between the current version and
the selected version. Press enter to open the selected version.

For more:

    :h Gundo


## MRU

Press ,mm to open a list of recently opened files. Press enter or o to open
and q to quit.

## Indent-guides

Press ,ig to toggle display of indent guides.

For more:

    :h indent-guides

## Status

Gives a nice statusline that shows a lot of info:

    Filename                ~/.vim/commands.md
    CheckUnix               
    Encoding
    Help                    [help]
    Filetype                [markdown]
    Modified                [+]
    Fugitive                [Git(master)]
    RVM
    TabWarning              mixed-tabs
    TrailingSpaceWarning    [\s]
    Syntastic
    Paste
    ReadOnly                [ro]
    RightSeperator
    CurrentHighlight        [mdBlockCode] 
    CursorColumn            30
    LineAndTotal            345/356
    FilePercent             Bot

For more:

    vim ~/.vim/bundles/status.vim/README.md

## Syntastic

Automatically checks syntax and displays a warning in the status line if there
are syntax errors.

For more:

    :h syntastic

## NERDTree

Press ,nn to start NERDTree. Press ? for help.

For more:

    :h NERDTree


## Tabular

For aligning symbols across multiple lines. E.g.

    a = 10
    blah = 20

    :Tab /=

    a    = 10
    blah = 20


    | This | is |
    | a| markdown |
    |table| |

    :Tab /|

    | This  | is       |
    | a     | markdown |
    | table |          |

There are more options that control spacing, alignment, etc.  For more:

    :h tabular

## YankRing

Vim keeps track of all text that gets cut or yanked. YankRing provides easier
access to this history.

Press ,yy to activate. Select text and press enter or p to paste. For more
options press ?

For more info:

    :h yankring

## Unimpaired

Adds a bunch of common mappings that use the square bracket keys.

    [q / ]q                     Next / previous quickfix entry
    [b / ]b                     Next / previous buffer
    [B / ]B                     First / last buffer
    [l / ]l                     Next / previous location
    [L / ]L                     First / last location

## Extradite

Extradite is a plugin for viewing the git commit history of the current file.

    :Extradite                  Toggles showing the commit log of the current
                                file
    <cr>                        Open the currently selected commit
    d[h|v|y]                    Diff against the current file
    q                           Close the window

For more:

    :h Extradite

## gitv

Gitv is a git commit browser plugin. It visually shows the git history and
allows you to browse, do diffs, etc.

    :Gitv                       Start gitv in browser mode.
    :Gitv!                      Start gitv in file mode.
    q                           Quit gitv
    <enter>                     Show commit info
    S                           Show diffstat
    D                           Show diff (only in file mode)

    

For many more commands see:

    :h Gitv


## SnipMate

SnipMate implements a TextMate-like snippets feature in vim. These are short
words or sequences of letters that then expand out into somehting larger when
you press tab.

For example, in a python file:

    #!<tab>
    #!/usr/bin/env python

    for<tab>
    for ${1:needle} in ${2:haystack}:
        ${3:code}

The cursor will begin with the $1 part selected. Type to replace the text and
hit tab to move to the $2 part etc.

You can define your own snippets in the snippets directory. For much more info
see:

    :h snipmate

## ConqueTerm

ConqueTerm is a plugin that turns a vim buffer into an interactive window so you
can run and interact with terminal commands.

    :ConqueTerm bash                Will start a terminal with bash as the
                                    shell.
    <F8>                            Use insert mode to edit the terminal
    <F9>                            Send selected text to buffer
    <F10>                           Send the entire file to the buffer
    <F11>                           Execute the current file in a new buffer
    <esc><esc>                      Press <esc> twice to send an escape char to
                                    the terminal window.

## Notes

All notes are stored in a central directory and are easily accessed with the
:Notes command.

    :Note                           Starts a new blank note. Filename will be
                                    set based on the title
    :Note blah                      Will load a note with blah in the title or
                                    create a new blank note if there is none.
    :DeleteNote                     Deletes the current note
    :SearchNotes kw1 kw2            Find notes with both kw1 and kw2
    :SearchNotes /regex/            Search for notes matching regex
    :SearchNotes                    Search for word under the cursor
    :RelatedNotes                   Find all notes related to current file
    :RecentNotes                    Lists notes by modification date

## Indent-object

This plugin adds objects that are useful for editing python blocks.

    ai      An indentation level and line above
    ii      An indentation level
    aI      An indentation level and lines above/below

    vii     Select the current indent level in visual mode
    cii     Change the current block
## Smart-input

This plugin adds in mappings to automatically add closing braces, quotes, etc.
This works similarly to how things worked in TextMate.
