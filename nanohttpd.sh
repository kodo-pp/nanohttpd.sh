#!/bin/bash
while :; do
D=cat\ /etc/nanohttpd.sh;p=`$D/port.txt`;ncat -vlc 'D=cat\ /etc/nanohttpd.sh
N=/dev/null
C=Content
d=`$D/dir.txt`;F=`$D/404.link`;I=`$D/index_file.txt`;X=`$D/403.link`
read m p v; cd $d; echo Req "$p" >&2
if [[ $p/ =~ .*[.][.]/.* ]];then
    echo -e "$v 403 Forbidden\n$C-Type: "`file -bi "$X"`"\n$C-Length: "`stat -c %s "$X"`"\n"
    cat "$X"
    exit
fi
if [ -d "./$p" ];then p="$p/$I"; fi
if [ -f "./$p" ];then
    echo -e "$v 200 OK\n$C-Type: "`file -bi "./$p"`"\n$C-Length: "`stat -c %s "./$p"`"\n"
    cat "./$p"
else
    echo -e "$v 404 Not found\n$C-Type: "`file -bi "$F"`"\n$C-Length: "`stat -c %s "$F"`"\n"
    cat "$F"
fi' $p
done
