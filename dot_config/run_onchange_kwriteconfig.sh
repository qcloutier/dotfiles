#!/bin/sh -e

if [ "$XDG_CURRENT_DESKTOP" != KDE ]; then
  echo "Not running KDE Plasma; skipping config load"
  exit 0
fi

_() {
  _file="$(echo "$@" | grep '^\./' | sed 's/^\.\//--file /')"
  [ -z "$_file" ] || { file="$_file"; return; }

  _groups="$(echo "$@" | grep '^\[.*\]$' | sed -e 's/^/ /' -e 's/\[/--group /g' -e 's/\]/ /g')"
  [ -z "$_groups" ] || { groups="$_groups"; return; }

  key="$(echo "$@" | grep '=' | sed -e 's/^/--key /' -e 's/=.*//')"
  value="$(echo "$@" | grep '=' | sed 's/.*=//')"
  [ -z "$key" -o -z "$value" ] || kwriteconfig${KDE_SESSION_VERSION} $file $groups $key -- "$value"
}

_
_ ./PlasmaDiscoverUpdates
_
_ [Global]
_ RequiredNotificationInterval=-1
_
_ ./discoverrc
_
_ [Software]
_ UseOfflineUpdates=false
_
_ ./kglobalshortcutsrc
_
_ [kitty.desktop]
_ _k_friendly_name=kitty
_ _launch=Meta+Return,none,kitty
_
_ ./kscreenlockerrc
_
_ [Daemon]
_ LockGrace=30
_ Timeout=12
_
_ [Greeter][Wallpaper][org.kde.image][General]
_ Image=$HOME/Desktop/Sync/.wallpaper.png
_ PreviewImage=$HOME/Desktop/Sync/.wallpaper.png
_
_ ./kwinrc
_
_ [Desktops]
_ Id_1=11111111-1111-1111-1111-111111111111
_ Id_2=22222222-2222-2222-2222-222222222222
_ Name_1=#1
_ Name_2=#2
_ Number=2
_ Rows=1
_
_ ./kxkbrc
_
_ [Layout]
_ Options=caps:swapescape
_ ResetOldOptions=true
_
