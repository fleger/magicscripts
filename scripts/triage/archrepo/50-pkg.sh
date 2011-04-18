. "$MAGICSCRIPTS_D/etc/repo.conf"

PKGNAME=1
PKGVER=2
PKGREL=3
ARCH=4

[[ "$2" =~ ^(.+)\-(.+)-([0-9]+)\-([^\-.]+)\.pkg\.tar\.[xg]z$ ]] &&

mv "$1/$2" "$REPO_PATH/.${BASH_REMATCH[$ARCH]}/$2" &&

if [ "${BASH_REMATCH[$ARCH]}" = "any" ]; then
  local a
  for a in "${REPO_ANYS[@]}"; do
    repo-add "$REPO_PATH/$a/$REPO_DB" "$REPO_PATH/$a/$2"
  done
else
  repo-add "$REPO_PATH/${BASH_REMATCH[$ARCH]}/$REPO_DB" "$REPO_PATH/${BASH_REMATCH[$ARCH]}/$2"
fi
