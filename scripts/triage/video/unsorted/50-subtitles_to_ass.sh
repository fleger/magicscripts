. "$MAGICSCRIPTS_D/etc/env.sh"

[[ "$2" == *.@(srt|ssa|sub) ]] &&
echo "Going to convert $1/$2 to ass..." &&
cd "$1" &&
local tmpDir &&
tmpDir="$(mktemp -d)" &&
cp "$1/$2" "$tmpDir" &&
sed -i -r -e 's/<font color=(#[0-9a-fA-F]+)>/<font color="\1">/g' "$tmpDir/$2" &&
srt2ass "$tmpDir/$2" &&
echo "$1/$2 succesfully converted to ass." &&
rm "$tmpDir/$2" &&
rmdir "$tmpDir" &&
rm "$1/$2"

