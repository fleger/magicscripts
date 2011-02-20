SUBTITLE_BAD_PREFIX="subFilter."

subtitleFilter() {
    local line
    local f
    while read line; do
        local clean=true
        for f in $(compgen -A function "$SUBTITLE_BAD_PREFIX"); do
            if $f "$line" >/dev/null; then
                clean=false &&
                break
            fi
        done
        $clean && echo "$line"
    done
}

