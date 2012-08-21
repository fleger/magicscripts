. "$MAGICLIB_D/libcommon.sh"
. "$MAGICSCRIPTS_D/etc/clean.sh"

local pattern
for pattern in "${CLEAN_PATTERNS[@]}"; do
  [[ "$2" == $pattern ]] && {
    rm "$1/$2"
    break
  }
done

