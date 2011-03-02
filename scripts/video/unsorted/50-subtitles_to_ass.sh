. "$MAGICSCRIPTS_D/etc/env.sh"

[[ "$2" == *.@(srt|ssa|sub) ]] &&
echo "Going to convert $1/$2 to ass..." &&
cd "$1" &&
srt2ass "$1/$2" &&
echo "$1/$2 succesfully converted to ass." &&
rm "$1/$2"