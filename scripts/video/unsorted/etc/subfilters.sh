subFilter.noCommentaries() {
    echo "$1" | grep "\bcom\b"
    return $?
}

subFilter.noForced() {
    echo "$1" | grep "\bforced\b"
    return $?
}


subFilter.noNoTAG() {
    echo "$1" | grep -i "\bnotag\b"
    return $?
}


