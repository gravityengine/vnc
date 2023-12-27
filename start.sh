#!/bin/bash
# ls
# # umask 0077                # use safe default permissions
# mkdir -p "$HO/.vnc"     # create config directory
# chmod go-rwx "$HO/.vnc" # enforce safe permissions
# ls -l
tigervnc_path="/tigervnc-${tigervnc_version}.x86_64/usr/bin"

# Start TigerVNC
if [ ! -z $VNC_PASSWD ]; then
	${tigervnc_path}/vncpasswd -f <<< "$VNC_PASSWD" > ".vnc/passwd"
	${tigervnc_path}/vncserver -rfbport 5900 -geometry ${GEOMETRY} -depth ${DEPTH}
else
	${tigervnc_path}/vncpasswd -f <<< "" > ".vnc/passwd"
	${tigervnc_path}/vncserver -rfbport 5900 -geometry ${GEOMETRY} -depth ${DEPTH} -SecurityTypes None
fi

cat /noVNC-${noVNC_version}/utils/launch.sh

# Start noVNC
/noVNC-${noVNC_version}/utils/launch.sh
