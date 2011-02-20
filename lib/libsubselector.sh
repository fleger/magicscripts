SUBTITLE_EVAL_PREFIX="subScoreModifier."

subtitleSelector() {
    local bestScore=-1
    local bestLine=""
    local line
    while read line; do
        local lineScore=0
        for f in $(compgen -A function "$SUBTITLE_EVAL_PREFIX"); do
            $f "$line" > /dev/null
            ((lineScore=lineScore+$?))
        done
        [[ $lineScore -gt $bestScore ]] && bestScore=$lineScore && bestLine="$line"
    done
    echo "$bestLine"
}