#!/bin/ash
docker run -i --rm -v /mnt/sda3/Youtube/audio/:/audios falconchen/youtube-dl-audio  $@
