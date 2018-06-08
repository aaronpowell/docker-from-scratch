ECHO OFF

ECHO Extract a rar file

docker run --platform=linux --rm -v %CD%:/files maxcnunes/unrar unrar x -r Trunk.rar