# Prefer ass subtitles (weight: 1)
subScoreModifier.ass() {
    if echo "$1" | grep -i ".ass$" &> /dev/null; then
        return 1
    else
        return 0
    fi
}

# Prefer french subtitles (weight: 10)
subScoreModifier.fr() {
    if echo "$1" | grep -i -r "\bfr\b" &> /dev/null; then
        return 10
    else
        return 0
    fi
}

subScoreModifier.french() {
    if echo "$1" | grep -i -r "\bfrench\b" &> /dev/null; then
        return 10
    else
        return 0
    fi
}

subScoreModifier.vf() {
    if echo "$1" | grep -i -r "\bvf\b" &> /dev/null; then
        return 10
    else
        return 0
    fi
}

# Prefer dvd  (weight: 3)
subScoreModifier.dvd() {
    if echo "$1" | grep -i -r "\bdvd\b" &> /dev/null; then
        return 3
    else
        return 0
    fi
}

# Prefer dvd-bbc (for doctor who, weight: 1)
subScoreModifier.bbc() {
    if echo "$1" | grep -i -r "\bbbc\b" &> /dev/null; then
        return 1
    else
        return 0
    fi
}

# Prefer hdtv/xvid over 720p  (weight: 2)
subScoreModifier.hdtv() {
    if echo "$1" | grep -i -r "\bhdtv\b" &> /dev/null; then
        return 2
    else
        return 0
    fi
}

subScoreModifier.720p() {
    if echo "$1" | grep -i -r "\b720p\b" &> /dev/null; then
        return 0
    else
        return 2
    fi
}

# Commmon hdtv rip team
subScoreModifier.fqm() {
    if echo "$1" | grep -i -r "\bfqm\b" &> /dev/null; then
        return 2
    else
        return 0
    fi
}

subScoreModifier.xvid() {
    if echo "$1" | grep -i -r "\bxvid\b" &> /dev/null; then
        return 2
    else
        return 0
    fi
}