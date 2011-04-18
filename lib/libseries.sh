. "$MAGICSCRIPTS_D/etc/series.conf"

installEpisode() {
  mkdir -p """$(dirname "$SERIES_BASE_PATH/$2")""" &&
  echo "Installing $1 to $SERIES_BASE_PATH/$2" &&
  mv -b "$1" "$SERIES_BASE_PATH/$2"
}
