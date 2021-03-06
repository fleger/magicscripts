. "$MAGICSCRIPTS_D/etc/dl.sh"


# Move subtitles to video unsorted
# NOTE: no mime type available for subtitles

[[ "$2" == *.@(srt|ssa|sub|ass) ]] &&
[ -d "$DL_UNSORTED_VIDEO_DEST" ] &&
mv "$1/$2" "$DL_UNSORTED_VIDEO_DEST" &&
kdialog --display ":0" --title "Downloads" --passivepopup "$2 moved to $DL_UNSORTED_VIDEO_DEST"

