. "$MAGICSCRIPTS_D/etc/series.conf"

readonly DODONA_DIR="$HOME/projects/dodona/video"

installDodona() {
  [[ ! -f "$1/.dodona" ]] && install -Dm644 "$DODONA_DIR/dodona-season.sh" "$1/.dodona"
  [[ ! -f "$1/.state" ]] && > "$1/.state"
  local showDir=$(dirname "$1")
  [[ ! -f "$showDir/.dodona" ]] && install -Dm644 "$DODONA_DIR/dodona-show.sh" "$showDir/.dodona"
  [[ ! -f "$showDir/.state" ]] && > "$showDir/.state"
  return 0
}

installEpisode() {
  local dirName="$(dirname "$2")" &&
  local d &&
  for d in "${SERIES_MIRROR_DIRECTORIES[@]}"; do
    mkdir -p "$d/$dirName"
    installDodona "$d/$dirName"
  done &&
  echo "Installing $1 to $SERIES_BASE_PATH/$2" &&
  mkdir -p "$SERIES_DESTINATION/$dirName" &&
  mv -b "$1" "$SERIES_DESTINATION/$2"
  for d in "${SERIES_LINK_DIRECTORIES}"; do
    mkdir -p "$d"
    ln -sf "$SERIES_BASE_PATH/$2" "$d"
  done
}
