. "$MAGICSCRIPTS_D/etc/series.conf"

installEpisode() {
  mkdir -p """$(dirname "$SERIES_BASE_PATH/$2")""" &&
  echo "Installing $1 to $SERIES_BASE_PATH/$2" &&
  mv -b "$1" "$SERIES_BASE_PATH/$2" &&
  torssadd -t "$SERIES_RSS_TITLE" -d "$SERIES_RSS_DESCRIPTION" -l "$SERIES_BASE_URL" "$SERIES_RSS_PATH" \
         """$(basename "$2")""" \
         """$(basename "$2")""" \
         "$SERIES_BASE_URL/$2"
}