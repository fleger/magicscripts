. "$MAGICLIB_D/libseries.sh"

local CORRECT_NAME_REGEX="^(.+)_([0-9]+)x([0-9]+)(.*)$"
local filePath
local series="$2"
local season=""

[ -f "$1/$2" ] &&
while [[ "$series" =~ $CORRECT_NAME_REGEX ]]; do
  series="${BASH_REMATCH[1]}"
  season="${BASH_REMATCH[2]}"
done &&
filePath="${series}/${series}_Season_${season}/${2}" &&
installEpisode "$1/$2" "$filePath"