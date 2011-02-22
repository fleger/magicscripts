. "$MAGICLIB_D/libcommon.sh"
. "$MAGICSCRIPTS_D/etc/dl.sh"

# Move subtitle rar archives to video unsorted (untested)
[[ """$(file --mime-type -b "$1/$2")""" == "application/x-rar" ]] &&
unrar lb "$1/$2" | isSubtitleArchive &&
echo "$1/$2 detected as subtitle archive." &&
[ -d "$DL_UNSORTED_VIDEO_DEST" ] &&
mv "$1/$2" "$DL_UNSORTED_VIDEO_DEST" &&
echo "$1/$2 moved to $DL_UNSORTED_VIDEO_DEST."