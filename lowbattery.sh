#!/bin/bash

BATTINFO=`acpi -b`

echo $BATTINFO | grep Discharging
if [ $? -ne 1 ] ; then
    echo $BATTINFO
    BATTPERCENT=`echo "$BATTINFO" | awk '{split($0,a,","); print a[2]}'`
    PERCENT=`echo $BATTPERCENT | sed 's/%//'`
    echo $PERCENT

    if [ $PERCENT -lt 10 ] ; then
         DISPLAY=:0.0 /usr/bin/i3-nagbar -m "low battery"
    fi
fi
