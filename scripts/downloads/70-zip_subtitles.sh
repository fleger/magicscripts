. "$MAGICSCRIPTS_D/lib/libcommon.sh"

[[ """$(file --mime-type -b "$1/$2")""" == "application/zip" ]] &&
unzip -l "$1/$2" | isSubtitleArchive &&
echo "$1/$2 detected as subtitle archive." &&
[ -d "$DL_UNSORTED_VIDEO_DEST" ] &&
mv "$1/$2" "$DL_UNSORTED_VIDEO_DEST" &&
echo "$1/$2 moved to $DL_UNSORTED_VIDEO_DEST."