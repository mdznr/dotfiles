function abbrev -d "Install fish abbreviations"
    # git
    abbr g git
    abbr leaderboard git shortlog -sn
	abbr gu 'cd ../; gitroot'
    
    # vim
    abbr vv 'find . | fzf | xargs -o vim'
	abbr mvv 'find . | fzf | xargs mvim'

    # Misc.
    abbr c cd
	abbr l ls
end
