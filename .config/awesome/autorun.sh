#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run setxkbmap -layout "us,ee" -option caps:swapescape
run compton
run /usr/bin/nm-applet
run redshift-gtk
run dropbox start

