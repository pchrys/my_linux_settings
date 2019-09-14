vim plugin for enhanced vimdiff

I've looked for a solution to this for a long time and I found the EnhancedDiff plugin to be the easiest solution which makes your diffs slightly more intelligent to begin with :)
1. Installation (https://github.com/chrisbra/vim-diff-enhanced#installation)

Use the plugin manager of your choice:

    Pathogen
        git clone https://github.com/chrisbra/vim-diff-enhanced.git ~/.vim/bundle/vim-enhanced-diff
        :Helptags (only needed once after the installation to install the documentation)
    NeoBundle
        NeoBundle 'chrisbra/vim-diff-enhanced'
    Vundle
        Plugin 'chrisbra/vim-diff-enhanced'
    Vim-Plug
        Plug 'chrisbra/vim-diff-enhanced'

2. Diff as usual

Using vimdiff, nvim -d or diffthis for example
3. Set the filter

:EnhancedDiffIgnorePat ^WARNING:.*

4. Re-diff

:diffupdate


