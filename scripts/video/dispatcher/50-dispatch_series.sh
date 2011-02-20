. "$MAGICSCRIPTS_D/lib/libseries.sh"

local CORRECT_NAME_REGEX="^(.+)_([0-9]+)x([0-9]+)(.*)$"
local filePath

[ -f "$1/$2" ] &&
[[ "$2" =~ $CORRECT_NAME_REGEX ]] &&
filePath="${BASH_REMATCH[1]}/${BASH_REMATCH[1]}_Season_${BASH_REMATCH[2]}/$2" &&
installEpisode "$1/$2" "$filePath"