#!/bin/bash

_scrape() {
    lynx --listonly --nonumbers --dump $1 | grep $2 > urls.txt
    xargs --max-lines=1 lynx --listonly --nonumbers --dump < urls.txt | grep "magnet:?" > magnets.txt
    while read m; do
        transmission-remote -a $m;
    done < magnets.txt
    transmission-remote -l
}

_search() {
    if [$2 = '']; then
        s="https://www2.thepiratebay3.to/s/?q="$1
    else    
        s="https://www2.thepiratebay3.to/s/?q="$1"&"$2"=on&category=0"
    fi
    echo $s
    _scrape $s "1"
}


_main() {
    read -p "Enter search term: " s
    read -p "Enter category: " c
    _search $s $c
}

_main