. "$MAGICSCRIPTS_D/etc/series.conf"

installEpisode() {
  local dirName="$(dirname "$2")"
  mkdir -p "$SERIES_BASE_PATH/$dirName" &&
  local d &&
  for d in "${SERIES_MIRROR_DIRECTORIES[@]}"; do
    mkdir -p "$d/$dirName"
  done &&
  echo "Installing $1 to $SERIES_BASE_PATH/$2" &&
  mv -b "$1" "$SERIES_BASE_PATH/$2"
}
