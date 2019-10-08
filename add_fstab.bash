#!/usr/bin/env bash

if grep Zeus /etc/fstab; then
  exit 0
fi

# create mount points
for d in /Volumes/{L,T800,Phillips,Zeus,Hera} /data/Luna{1,2} /opt/ni_tools/passwd; do
  [ ! -d $d ] && mkdir -p $d
done
# create password files
[ ! -r /opt/ni_tools/passwd/lncd ] && echo -e "lncd pass:" && read p && echo -e "user=lncd\npassword=$p" >  /opt/ni_tools/passwd/lncd
if [ ! -r /opt/ni_tools/passwd/beares ]; then 
    echo -n "upmc user:" 
    read u 
    echo -n "upmc pass:" 
    read p 
    echo -e "user=$u\npassword=$p" >  /opt/ni_tools/passwd/beares
fi

# add to fstab
cat >>/etc/fstab <<EOF
/oacres1.acct.upmchs.net/rcn1/                     /Volumes/L cifs  users,noauto,nobrl,credentials=/opt/ni_tools/passwd/beares,comment=systemd.automount,iocharset=utf8,uid=1000,gid=100,rw 0 0
##### wallace/gromit lunashare
//gromit.wpic.upmc.edu/luna1/Luna/      /data/Luna1 cifs  users,noauto,nobrl,user=foranw,password=winter14,iocharset=utf8,uid=1000,gid=100,rw 0 0
//gromit.wpic.upmc.edu/luna2/Luna/      /data/Luna2 cifs  users,noauto,nobrl,user=foranw,password=winter14,iocharset=utf8,uid=1000,gid=100,rw 0 0
//arnold.wpic.upmc.edu/T800 /Volumes/T800 cifs  credentials=/opt/ni_tools/passwd/lncd,rw,users,nobrl,iocharset=utf8,uid=1000,gid=1000,sec=ntlmssp,noperm,nounix 0 2
//10.145.64.109/Phillips /Volumes/Phillips cifs  credentials=/opt/ni_tools/passwd/skynet,rw,users,nobrl,iocharset=utf8,uid=1000,gid=1000,sec=ntlmssp,noperm,nounix 0 2
//rhea.wpic.upmc.edu/Zeus/        /Volumes/Zeus cifs  users,noauto,nobrl,credentials=/opt/ni_tools/passwd/lncd,iocharset=utf8,uid=1000,gid=100,rw 0 0
//10.145.64.21/Hera/        /Volumes/Zeus cifs  users,noauto,nobrl,credentials=/opt/ni_tools/passwd/lncd,iocharset=utf8,uid=1000,gid=100,rw 0 0
EOF
