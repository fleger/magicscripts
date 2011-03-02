. "$MAGICLIB_D/libcommon.sh"
. "$MAGICLIB_D/libsubfilter.sh"
. "$MAGICSCRIPTS_D/etc/subfilters.sh"
. "$MAGICSCRIPTS_D/etc/env.sh"

local OLD_IFS="$IFS"
[[ "$(file --mime-type -b $1/$2)" == "application/zip" ]] &&
! isARecognizableName "$2" &&
unzip -l "$1/$2" | isSubtitleArchive &&
local tmpDir="$(mktemp -d)" &&
unzip -jx "$1/$2" -d "${tmpDir}" > /dev/null &&
IFS=$'\n' &&
mv $(find "${tmpDir}" -type f \( -name "*.ass" -o -name "*.srt" -o -name "*.sub" -o -name "*.ssa" \) -print | subtitleFilter) "$1"
local result="$?"
IFS="$OLD_IFS"
rm -rf "$tmpDir"
return $result