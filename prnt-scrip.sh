#!/bin/sh

if [ "$1" = "--help" ]; then
    echo "\nFuck you, buddy\n";
exit
fi

echo "This is for prnt.sc\nUpon completion, it will automatically scan the folder this script was ran in and delete any file with exactly 503 bytes, which is how big imgur's \"This image you are requesting does not exist\" placeholder image is (https://i.imgur.com/removed.png).\n\nAlso, it's currently slow af because wget is slow af and I couldn't be bothered to add multithreading. Feel free to send this script back to me with multithreading implemented, or just run it in a bunch of different shells at the same time lol.\n\nOh and don't do any dumb shit with whatever this script downloads - uni is fricked enough, I don't need a court case.\n"
if [ -z "$1" ]; then
    echo "\n\nprnt-scrip: missing COUNT\nUsage: prnt-scrip [COUNT]\n\nTry 'prnt-scrip --help' I guess, but there's no help there.\n";
exit
fi

echo "\n"

url="https://prnt.sc/"

for i in $(seq $1); do
    rand="`head /dev/urandom | tr -dc a-z | head -c3``head /dev/urandom | tr -dc 0-9 | head -c3`"
    echo "$i: $url$rand"
    wget -q `wget -qO - $url$rand | grep -oP '(?<=no-click screenshot-image" src=").*(?=" crossorigin)'`
done

before="`ls | wc -l`"
find -size 503c -delete
after="`ls | wc -l`"

echo "Removed $(($before-$after)) nonexistant/missing imgur PNGs.\n"
