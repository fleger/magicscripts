. "$MAGICSCRIPTS_D/etc/repo.conf"
 
[[ "$2" =~ ^(.+)\-(.+)-([0-9]+)\-(x86_64)\.pkg\.tar\.[xg]z$ ]] &&
mkdir -p "$1/x86_64" &&
mv "$1/$2" "$1/x86_64/$2" &&
repo-add "$1/x86_64/$REPO_DB" "$1/x86_64/$2" &&
# torssadd "$1/$REPO_RSS" """${BASH_REMATCH[1]} ${BASH_REMATCH[2]}-${BASH_REMATCH[3]} ${BASH_REMATCH[4]}" """$(tar -Oxaf "$1/${BASH_REMATCH[4]}/$2" .PKGINFO | grep "^pkgdesc =" | tail -c +11)""" "${BASE_URL}/${BASH_REMATCH[4]}/$2"