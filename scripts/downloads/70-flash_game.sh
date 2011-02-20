# Move swf to flash games

[[ """$(file --mime-type -b "$1/$2")""" == "application/x-shockwave-flash" ]] &&
[ -d "$DL_FLASH_GAMES_DEST" ] &&
mv "$1/$2" "$DL_FLASH_GAMES_DEST" &&
echo "$1/$2 moved to $DL_FLASH_GAMES_DEST."

