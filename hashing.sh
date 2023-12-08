#!/bin/bash
# vim: tw=80
# shellcheck disable=SC1007
#
# Trying a couple methods of hashing strings. Both from an input file, and
# walking through a string by character.
#
# Looking like it's too slow to actually do anything with.

# shellcheck disable=SC2034,SC2155,SC2164
declare -g PROGDIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd )
declare -g INPUT="${PROGDIR}/lorem.txt"

function h1 {
   local char
   local -i code
   declare -gi HASH=1

   while IFS= LANG=C read -r -d '' -N1 char ; do
      printf -v code '%d' "'${char}"
      (( HASH = (HASH << 1) + code ))
      # No real hashing algorithm right now.
      # Just getting general sense of timing.
   done < "$INPUT"
}

time h1
echo $HASH
