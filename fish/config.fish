
abbr ls "exa"
abbr l "exa"

if test -f $HOME/.autojump/share/autojump/autojump.fish; . $HOME/.autojump/share/autojump/autojump.fish; end

export LC_CTYPE="en_CA.UTF-8"
export PATH="$PATH:$HOME/.cargo/bin"

set -g theme_nerd_fonts yes
set -g theme_display_date no
fish_vi_key_bindings

set -g theme_display_vi no

