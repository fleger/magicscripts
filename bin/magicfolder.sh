#! /bin/bash

MAGIC_SCRIPT_NAME=".magicscript"
MAGIC_FILTER_PREFIX="magicFilters."
# LOG_FILE="/dev/null"
# LOG_FILE="/tmp/mf.log"
LOG_FILE=/dev/stdout

while getopts p: opt; do
  case "$opt" in
    p) MAGIC_FILTER_PREFIX="$OPTARG";;
  esac
done

shift $(($OPTIND - 1))

DIR_NAME="$1"
FILE_NAME="$2"

if [ -f "$1/$MAGIC_SCRIPT_NAME" ]; then
  . "$1/$MAGIC_SCRIPT_NAME"
fi

MAGICLIB_D=$HOME/.magiclib
MAGICSCRIPTS_D="$DIR_NAME/.magicscripts.d"

if [ -d "$MAGICSCRIPTS_D" ]; then
  for f in "$MAGICSCRIPTS_D"/*.sh; do
    echo "Reading $f" >> "$LOG_FILE"
    eval """
      $MAGIC_FILTER_PREFIX$(basename $f)() {
          [ -f "$f" ] && . "$f"
      }
    """
  done
fi

echo "$DIR_NAME" >> "$LOG_FILE"
echo "$FILE_NAME" >> ""$LOG_FILE""
for f in $(compgen -A function "$MAGIC_FILTER_PREFIX"); do
  echo "Trying $f" >> "$LOG_FILE"
  $f "$DIR_NAME" "$FILE_NAME" &>> "$LOG_FILE"  && exit 0
done

exit 1
