#!/bin/sh
#
# MusicBox equalizer presets script.
#

set_equalizer_curve() {
  curve="${*}"
  ctl=0
  for point in ${curve}
  do
    ctl=$(( ${ctl} + 1 ))
    echo cset numid=${ctl} ${point}
  done | amixer -D equal -s
}

profile="${1:-flat}"
case "${profile}" in
    off) curve= ;;
    default) curve="-  65 25 65 65 65 65 65 65 65 " ;;
    flat) curve="65 65 65 65 65 65 65 65 65 65 " ;;
    custom) curve= ;;
    classical) curve="59 59 59 59 59 59 62 62 62 62 " ;;
    club) curve="59 59 58 58 58 58 58 59 59 59 " ;;
    dance) curve="56 57 59 59 59 61 62 62 59 59 " ;;
    headphones) curve="58 56 58 60 60 59 58 56 55 55 " ;;
    bass) curve="57 57 57 58 59 61 62 63 63 63 " ;;
    treble) curve="62 62 62 61 59 56 54 54 54 54 " ;;
    large_hall) curve="56 56 58 58 59 61 61 61 59 59 " ;;
    live) curve="61 59 58 58 58 58 58 59 59 59 " ;;
    party) curve="57 57 59 59 59 59 59 59 57 57 " ;;
    perfect) curve="50 56 61 58 56 54 58 61 65 60 " ;;
    pop) curve="60 58 57 57 58 60 60 60 60 60 " ;;
    reggae) curve="59 59 59 61 59 57 57 59 59 59 " ;;
    rock) curve="57 58 61 62 60 58 57 56 56 56 " ;;
    ska) curve="60 61 61 59 58 58 57 56 56 56 " ;;
    soft_rock) curve="58 58 59 59 61 61 60 59 59 57 " ;;
    soft) curve="58 59 60 60 60 58 57 56 56 56 " ;;
    techno) curve="57 58 59 61 61 59 57 56 56 57 " ;;
    *) echo "Unknown profile ${profile}" >&2 ;;
esac

[ "${curve}" ] && set_equalizer_curve "${curve}"
