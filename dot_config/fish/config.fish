set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -gx CLICKHOUSE_HISTORY_FILE $XDG_STATE_HOME/clickhouse-client-history
set -gx GOPATH $XDG_DATA_HOME/go
set -gx HISTFILE $XDG_STATE_HOME/bash_history
set -gx KREW_ROOT $XDG_DATA_HOME/krew
set -gx LESSHISTFILE $XDG_STATE_HOME/lesshst
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx PSQL_HISTORY $XDG_STATE_HOME/psql_history
set -gx TENV_ROOT $XDG_DATA_HOME/tenv
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc

set -gx BROWSER org.mozilla.firefox
set -gx EDITOR nvim
set -gx TERMINAL kitty

set -gx AWS_EC2_METADATA_DISABLED true
set -gx AWS_VAULT_SECRET_SERVICE_COLLECTION_NAME login
set -gx BAT_OPTS --plain --theme=base16-256
set -gx DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock
set -gx FZF_DEFAULT_OPTS --inline-info --layout=reverse

fish_add_path $KREW_ROOT/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.local/bin

if status is-interactive
    fish_vi_key_bindings

    set -g fish_cursor_default block blink
    set -g fish_cursor_insert line blink
    set -g fish_cursor_replace_one underscore blink
    set -g fish_cursor_visual block blink
    set -g fish_greeting

    abbr -a av aws-vault
    abbr -a cz chezmoi
    abbr -a k kubectl
    abbr -a kf kubectl fuzzy
    abbr -a kn kubie ns
    abbr -a kx kubie ctx
    abbr -a tf terraform
    abbr -a tg terragrunt

    alias aws-vault 'set -e AWS_VAULT; command aws-vault'
    alias icat 'kitten icat --align=left'
    alias ssh 'kitten ssh'
    alias userctl 'systemctl --user'
    alias yta 'yt-dlp --extract-audio --add-metadata --sponsorblock-remove=sponsor'
    alias ytv 'yt-dlp --format="bestvideo[height<=?1080][fps<=?60][vcodec!=?vp9]+bestaudio/best" --sponsorblock-remove=sponsor'
end
