#!/bin/bash

[ "`id -u nobody`" != "$USER_ID" ] && usermod -u $USER_ID nobody && UID_CHANGED=true
[ "`id -g nobody`" != "$GROUP_ID" ] && usermod -g $GROUP_ID nobody && GID_CHANGED=true

if [ $UID_CHANGED ] || [ $GID_CHANGED ]; then
    chown -R nobody:users /home
    chown -R nobody:users /opt/NzbDrone
fi

exec /sbin/setuser nobody mono /opt/NzbDrone/NzbDrone.exe -nobrowswer -data=/config
