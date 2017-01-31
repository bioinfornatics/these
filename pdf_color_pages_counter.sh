#!/usr/bin/env bash
declare -i pages=0
declare -i pages_with_color=0
declare -i pages_blank=0
declare -i pages_black=0
declare cyan=0
declare magenta=0
declare yellow=0
declare black=0
LANG=C

equal_float(){
    result=false
    if [[ $(bc <<< "$1 == $2") -eq 1 ]]; then
        result=true
    fi
    echo "$result"
}

while read -r _cyan _magenta _yellow _black _; do
    cyan=$(bc <<< "$cyan + $_cyan")
    magenta=$(bc <<< "$magenta + $_magenta")
    yellow=$(bc <<< "$yellow + $_yellow")
    black=$(bc <<< "$black + $_black")
    
    ((pages++))
    
    if $(equal_float $_cyan 0) && $(equal_float $_magenta 0) && $(equal_float $_yellow 0); then
        if $(equal_float $_black 0); then
            ((pages_blank++))
        else
            ((pages_black++))
        fi
    else
        ((pages_with_color++))
    fi
    

done < <(gs -q -o - -sDEVICE=inkcov "$1")

echo 'total pages:'"$pages"
echo 'with color: '"$pages_with_color"
echo 'without color: '$(bc <<< "$pages - $pages_with_color")
echo 'black only: '"$pages_black"
echo 'blank: '"$pages_blank"

