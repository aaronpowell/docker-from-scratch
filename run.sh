echo Extract a rar file

docker run --platform=linux --rm -v "$(pwd):/files" maxcnunes/unrar unrar x -r Trunk.rar