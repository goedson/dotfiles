#!/bin/sh

origspace=$(xmodmap -pke | grep -E "space")
origctrl=$(xmodmap -pke |grep -E "Control_L")
newspace=$(echo $origctrl|sed 's/Control_L/space/g')
newctrl=$(echo $origspace|sed 's/space/Control_L/g')

xmodmap -e "$newspace"
xmodmap -e "$newctrl"
sleep 1
xmodmap -e "add control = Control_L Control_R"


 xcape -e 'Control_L=space'
