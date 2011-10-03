source ~/p/active/dotfiles/bash/env
source ~/p/active/dotfiles/bash/config
source ~/p/active/dotfiles/bash/aliases

eval "$(rbenv init -)"

if [[ -s ~/Dropbox/Bash/work ]] ; then source ~/Dropbox/Bash/work ; fi
if [[ -s ~/p/active/dotfiles/bash/work ]] ; then source ~/p/active/dotfiles/bash/work ; fi
