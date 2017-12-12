#!/bin/bash

# insert here urls
LINK=(

'http://streamguard.xyz/content/stream/films/pro.loff.2o17.o.webdl.1o8op/hls/360/segment'

)

mkdir my-videos
cd mkdir my-videos

CNT=0

for URL in ${LINK[@]}
do
  # create folder for streaming media
  CNT=$((CNT + 1))
  mkdir $CNT
  cd $CNT

  (

   DIR="${URL##*/}"

   # download all videos
   wget $URL''{293..500}.ts

   # link videos
   echo $DIR''{293..500}.ts | tr " " "\n" > tslist
   while read line; do cat $line >> $CNT.mp4; done < tslist

   rm -rf media* tslist
   ) &
   cd ..

done

wait
