. "$MAGICSCRIPTS_D/etc/repo.conf"

mkdir -p "$1/any" &&
mkdir -p "$1/i686" &&
mkdir -p "$1/x86_64" &&
[[ "$2" =~ ^(.+)\-(.+)-([0-9]+)\-(any)\.pkg\.tar\.[xg]z$ ]] &&
mv "$1/$2" "$1/any/$2" &&
ln -s "../any/$2" "$1/i686/$2" &&
ln -s "../any/$2" "$1/x86_64/$2" &&
repo-add "$1/i686/$REPO_DB" "$1/i686/$2" &&
repo-add "$1/x86_64/$REPO_DB" "$1/x86_64/$2" &&
# torssadd "$1/$REPO_RSS" """${BASH_REMATCH[1]} ${BASH_REMATCH[2]}-${BASH_REMATCH[3]} ${BASH_REMATCH[4]}" """$(tar -Oxaf "$1/${BASH_REMATCH[4]}/$2" .PKGINFO | grep "^pkgdesc =" | tail -c +11)""" "${BASE_URL}/${BASH_REMATCH[4]}/$2"