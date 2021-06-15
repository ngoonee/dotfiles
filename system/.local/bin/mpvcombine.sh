#!/bin/sh

for f in ./*.mkv;
do
  if [ -e "${f/.pdf}.png" ] ; then
    echo "Already processed"
  else
    echo "Processing $f"
    ffmpeg -i "$f" -filter_complex amerge=inputs=2 -ac 2 -map 0:v -map a -c:v copy "${f/.mkv}.mp4"
  fi
done

for f in 2021-06-14*.mp4; do
    echo "file '$f'" >> concatlist.txt
done

ffmpeg -f concat -safe 0 -i concatlist.txt -c copy 2021-06-14-ArtificialIntelligenceFullLecture.mp4

rm concatlist.txt
