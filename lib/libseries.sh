. "$MAGICSCRIPTS_D/etc/series.conf"

installEpisode() {
  local dirName="$(dirname "$2")" &&
  local d &&
  for d in "${SERIES_MIRROR_DIRECTORIES[@]}"; do
    mkdir -p "$d/$dirName"
  done &&
  echo "Installing $1 to $SERIES_BASE_PATH/$2" &&
  mkdir -p "$SERIES_BASE_PATH/$dirName" &&
  mv -b "$1" "$SERIES_BASE_PATH/$2"
  for d in "${SERIES_LINK_DIRECTORIES}"; do
    ln -s "$SERIES_BASE_PATH/$2" "$d"
  done
}
