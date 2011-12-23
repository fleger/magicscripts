echo "Single ZIP Subtitle extract"

. "$MAGICLIB_D/libcommon.sh"
. "$MAGICLIB_D/libsubselector.sh"
. "$MAGICSCRIPTS_D/etc/subscoremodifiers.sh"
. "$MAGICSCRIPTS_D/etc/env.sh"

[[ "x$(file --mime-type -b "$1/$2")" == "xapplication/zip" ]] &&
isARecognizableName "$2" &&
unzip -l "$1/$2" | isSubtitleArchive &&
echo "$1/$2 detected as a single subtitle archive." &&
local tmpDir="$(mktemp -d)" &&
unzip -x "$1/$2" -d "${tmpDir}" > /dev/null &&
local bestChoice="$(find "${tmpDir}" -type f \( -name "*.ass" -o -name "*.srt" -o -name "*.sub" -o -name "*.ssa" \) -print | subtitleSelector)" &&
echo "Best choice is $bestChoice." &&
mv "$bestChoice" "$1" &&
rm "$1/$2"

local result="$?"
rm -rf "$tmpDir"
return $result

