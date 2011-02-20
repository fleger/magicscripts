# Common functions
OLD_IFS="$IFS"
IFS=$'\n'
FILE_REGEXP=($(serenity -l tokenizers | while read line; do echo "$line"; read; done))
IFS="$OLD_IFS"

isARecognizableName() {
    local re
    for re in "${FILE_REGEXP[@]}"; do
        [[ $1 =~ $re ]] &&
        return 0
    done
    echo "$1 not recognizable"
    return 1
}

isSubtitleArchive() {
    grep -E "\.srt$|\.ass$|\.sub$|\.ssa$" > /dev/null
}