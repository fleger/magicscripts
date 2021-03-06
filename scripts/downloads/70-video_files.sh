. "$MAGICSCRIPTS_D/etc/dl.sh"


# Move videos to video unsorted
# TODO: use mime type instead of extensions

[[ "$2" == *.@(avi|divx|mp4|ogm|mkv|flv|wmv|mpg|mpeg|webm) ]] &&
[ -d "$DL_UNSORTED_VIDEO_DEST" ] &&
mv "$1/$2" "$DL_UNSORTED_VIDEO_DEST" &&
kdialog --display ":0" --title "Downloads" --passivepopup "$2 moved to $DL_UNSORTED_VIDEO_DEST"

