#!/bin/bash

usermod -u $USER_ID nobody
usermod -g $GROUP_ID nobody

exec /sbin/setuser nobody mono /opt/NzbDrone/NzbDrone.exe -nobrowswer -data=/config
