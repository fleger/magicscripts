. "$MAGICSCRIPTS_D/lib/libcommon.sh"
. "$MAGICSCRIPTS_D/lib/libsubfilter.sh"
. "$MAGICSCRIPTS_D/etc/subfilters.sh"

local OLD_IFS="$IFS"
[[ "$(file --mime-type -b $1/$2)" == "application/x-rar" ]] &&
! isARecognizableName "$2" &&
unrar lb "$1/$2" | isSubtitleArchive &&
local tmpDir="$(mktemp -d)" &&
cd "${tmpDir}" &&
unrar e "$1/$2" > /dev/null &&
IFS=$'\n' &&
mv $(find "${tmpDir}" -type f \( -name "*.ass" -o -name "*.srt" -o -name "*.sub" -o -name "*.ssa" \) -print | subtitleFilter) "$1"
local result="$?"
IFS="$OLD_IFS"
cd "$1"
rm -rf "$tmpDir"
return $result