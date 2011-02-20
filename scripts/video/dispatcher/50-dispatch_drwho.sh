. "$MAGICSCRIPTS_D/lib/libseries.sh"

quicksort() {
  local sortFunc="$1"
  shift
  local -a array=("$@")
  local -a l
  local -a g
  local pivot
  local x
  if [ ${#array[@]} -lt 2 ]; then
    echo ${array[@]}
  else
    pivot=${array[0]}
    for x in ${array[@]}; do
      if [ $x -gt $pivot ]; then
        l=( ${l[@]} $x )
      elif [ $x -lt $pivot ]; then
        g=( ${g[@]} $x )
      fi
    done
    echo $(quicksort $sortFunc "${l[@]}") $pivot $(quicksort $sortFunc "${g[@]}")
  fi
}


getDoctor() {
  echo "Arg: $1" >&2
  local -A limits
  limits=([203]="11th_Doctor"
          [167]="10h_Doctor"
          [157]="9th_Doctor"
          [156]="8th_Doctor"
          [144]="7th_Doctor"
          [136]="6th_Doctor"
          [116]="5th_Doctor"
          [75]="4th_Doctor"
          [51]="3rd_Doctor"
          [30]="2nd_Doctor"
          [1]="1st_Doctor")
  local limit
  for limit in $(quicksort "${!limits[@]}"); do
    echo "Limit: $limit" >&2 &&
    [ $1 -ge $limit ] &&
    echo "${limits[$limit]}" &&
    return 0
  done
}

local CORRECT_NAME_REGEX='^Doctor_Who_([0-9]{3})[_\-].+$'
local filePath

[ -f "$1/$2" ] &&
[[ "$2" =~ $CORRECT_NAME_REGEX ]] &&
filePath="Doctor_Who/$(getDoctor ${BASH_REMATCH[1]})/$2" &&
installEpisode "$1/$2" "$filePath"