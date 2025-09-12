set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -gx AZURE_CONFIG_DIR $XDG_DATA_HOME/azure
set -gx CLICKHOUSE_HISTORY_FILE $XDG_STATE_HOME/clickhouse-client-history
set -gx GOPATH $XDG_DATA_HOME/go
set -gx HISTFILE $XDG_STATE_HOME/bash_history
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
set -gx KREW_ROOT $XDG_DATA_HOME/krew
set -gx LESSHISTFILE $XDG_STATE_HOME/lesshst
set -gx MAVEN_ARGS --global-settings=$XDG_CONFIG_HOME/maven/settings.xml
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx PSQL_HISTORY $XDG_STATE_HOME/psql_history
set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
set -gx TENV_ROOT $XDG_DATA_HOME/tenv
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc

set -gx BROWSER org.mozilla.firefox
set -gx EDITOR nvim
set -gx TERMINAL kitty

set -gx AWS_EC2_METADATA_DISABLED true
set -gx AWS_VAULT_SECRET_SERVICE_COLLECTION_NAME login
set -gx BAT_OPTS --plain --theme=(test "$TERM" = xterm-kitty; and echo base16-256; or echo ansi)
set -gx DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock
set -gx FZF_DEFAULT_OPTS --inline-info --layout=reverse
set -gx JAVA_HOME $XDG_STATE_HOME/nix/profile
set -gx SSH_ASKPASS
set -gx TENV_AUTO_INSTALL true

fish_add_path -m /var/lib/flatpak/exports/bin
fish_add_path -m $XDG_DATA_HOME/flatpak/exports/bin
fish_add_path -m $PYTHONUSERBASE/bin
fish_add_path -m $KREW_ROOT/bin
fish_add_path -m $GOPATH/bin
fish_add_path -m $HOME/.local/bin $HOME/bin

if status is-interactive
    fish_vi_key_bindings
    fzf_key_bindings

    set -g fish_cursor_default block blink
    set -g fish_cursor_insert line blink
    set -g fish_cursor_replace_one underscore blink
    set -g fish_cursor_visual block blink
    set -g fish_greeting

    abbr -a av aws-vault
    abbr -a cm chezmoi
    abbr -a kf kubectl fuzzy
    abbr -a kn kubie ns
    abbr -a kx kubie ctx
    abbr -a --position anywhere k kubectl
    abbr -a --position anywhere tf terraform
    abbr -a --position anywhere tg terragrunt

    alias aws-vault 'set -e AWS_VAULT; command aws-vault'
    alias firefox 'org.mozilla.firefox'
    alias icat 'kitten icat --align=left'
    alias logctl 'journalctl --user'
    alias mpv 'io.mpv.Mpv'
    alias ssh 'kitten ssh'
    alias userctl 'systemctl --user'
    alias yta 'yt-dlp --extract-audio --format=bestaudio/best'
    alias ytv 'yt-dlp'
end
