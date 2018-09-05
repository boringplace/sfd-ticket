#/bin/bash

which figlet >/dev/null 2>&1 || { echo "figlet not found!"; exit 1; }
which git >/dev/null 2>&1 || { echo "git not found!"; exit 1; }

[ -d figlet-fonts ] || git clone https://github.com/xero/figlet-fonts

figlet -C utf8 -d figlet-fonts -c -f Bloody 'S F D' >00-text-sfd-bloody.txt
figlet -C utf8 -d figlet-fonts -c -f smmono12 'День Свободы ПО' >01-text-SFD-full-ru.txt
patch <01-text-SFD-full-ru.txt.patch >/dev/null
figlet -C utf8 -d figlet-fonts -w88 -f smmono12 "в 'Скучном месте'" > 02-text-at-boringplace-ru.txt

mkdir -p ticket
cat *-text-*.txt >ticket/text-SFD-ru.txt &&
    echo "Ticket generated: ticket/text-SFD-ru.txt"
