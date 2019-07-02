# FISH CONFIG

# List files dirs first, alphanumerically
function l
    ls -l --color -h --group-directories-first $argv
end

# List All files dirs first, alphanumerically
function lla
    ls -la --color -h --group-directories-first $argv
end

# Git Status
function gs
    git status --untracked-files
end

# Git ReBase (interactive)
function grb
    git rebase --interactive $argv
end

# Git LOG
function glog
    git log --graph --oneline --decorate
end

# Git Commit All (with message)
function gca
    git commit -am $argv
end

# Git Add/All Commit All (with message)
function gaca
    git add -A
    git commit -am $argv
end

# Git Push Origin
function gpo
    git push origin
end

# Git (add,) Commit all And Push
function gcap
    gaca $argv
    gpo
end

# Git Fetch All
function gfa
    git fetch --all
end

# Git PUll
function gpu
    git pull
end

# Git Merge
function gm
    git merge
end

# Git Checkout
function gc
    git checkout
end

# Git Checkout New Branch
function gcnb
    gc -b $argv
end

function xkb-us
    setxkbmap us -option ctrl:nocaps
end

function xkb-se
    setxkbmap se -option ctrl:nocaps
end

