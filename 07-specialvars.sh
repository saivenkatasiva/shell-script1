#!/bin/bash
echo "all variables :$@"
echo "number of variables passed : $#"
echo "scipt name :$0"
echo "current working direc: $PWD"
echo "HOME DIRECTORY: $HOME"
echo "user:$USER"
echo "hostname :$HOSTNAME"
echo "process id of currentshell script $$"
sleep 60 &
echo "process id of last background command : $!"