. "$MAGICLIB_D/libcommon.sh"
. "$MAGICLIB_D/libsubfilter.sh"
. "$MAGICSCRIPTS_D/etc/subfilters.sh"
. "$MAGICSCRIPTS_D/etc/env.sh"

local OLD_IFS="$IFS"
[[ "x$(file --mime-type -b "$1/$2")" == "xapplication/x-rar" ]] &&
! isARecognizableName "$2" &&
unrar lb "$1/$2" | isSubtitleArchive &&
local tmpDir="$(mktemp -d)" &&
cd "${tmpDir}" &&
unrar e "$1/$2" > /dev/null &&
IFS=$'\n' &&
mv "$(find "${tmpDir}" -type f \( -name "*.ass" -o -name "*.srt" -o -name "*.sub" -o -name "*.ssa" \) -print | subtitleFilter)" "$1"
local result="$?"
IFS="$OLD_IFS"
cd "$1"
rm -rf "$tmpDir"
return $result

