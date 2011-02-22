. "$MAGICSCRIPTS_D/etc/proxy.sh"

[[ "$2" == *.@(avi|mp4|mkv|flv|wmv|mpg|mpeg|webm|ogm|ogv|ass) ]] &&
cd "$1" &&
echo "Trying serenaming $1/$2..." &&
# Unglourious hack to avoid having too many requests at the same time
sleep $(echo "0.$(( $RANDOM % 10 )) * 3" | bc)
VERSION_CONTROL="numbered" serenity -b "$1/$2" &&
echo "Serenaming $1/$2 successful."