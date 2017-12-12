#!/bin/bash
set -e
set -o pipefail
#usage: removeline.sh file_path line_num
function usage {
    echo "usage: $0 file_path> <line_number(s)>"
    echo "...<line_number> can contains single number or list of numbers in format: 11|34|41"
    exit 1
}
if [ $# -eq 0 ] || [ -z "$1" ] || [ -z "$2" ]
then
    usage
fi
#save temp file without line(s)
filepath=$(realpath $1)
awk "NR!~/^($2)\$/" $filepath > /tmp/.tmpfile.tmp
cat /tmp/.tmpfile.tmp 

mv /tmp/.tmpfile.tmp $filepath
