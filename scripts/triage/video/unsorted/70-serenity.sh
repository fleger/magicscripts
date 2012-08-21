. "$MAGICSCRIPTS_D/etc/env.sh"

[[ "$2" == *.@(avi|divx|mp4|mkv|flv|wmv|mpg|mpeg|webm|ogm|ogv|ass) ]] &&
cd "$1" &&
echo "Trying serenaming $1/$2..." &&
VERSION_CONTROL="numbered" "$HOME/projects/serenity/serenity-devel" rename -b "$1/$2" &&
echo "Serenaming $1/$2 successful."

