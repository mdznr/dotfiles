#!/bin/bash

DOCKUTILBIN=~/bin/dockutil/scripts/dockutil
DOCKUTILADD="$DOCKUTILBIN --add"

killall Dock

# First, remove all items from the Dock
$DOCKUTILBIN --remove all --no-restart

# Then, add in the apps that I prefer to have there:
$DOCKUTILADD /Applications/Safari.app --no-restart
$DOCKUTILADD /Applications/Mail.app --no-restart
$DOCKUTILADD /Applications/Calendar.app --no-restart
$DOCKUTILADD /Applications/Notes.app --no-restart
$DOCKUTILADD /Applications/Messages.app --no-restart
$DOCKUTILADD /Applications/Slack.app --no-restart
$DOCKUTILADD /Applications/Sketch.app --no-restart
$DOCKUTILADD /Applications/Sketch\ Beta.app --no-restart
$DOCKUTILADD /Applications/Xcode.app --no-restart
$DOCKUTILADD /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app --no-restart
$DOCKUTILADD /Applications/Utilities/Terminal.app --no-restart
$DOCKUTILADD /Applications/GitUp.app --no-restart

$DOCKUTILADD "~/Downloads" --view fan --display stack --no-restart

killall Dock
