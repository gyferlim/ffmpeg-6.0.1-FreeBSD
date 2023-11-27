#!/bin/sh
clear

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# File path
FILE_PATH="/usr/local/etc/pkg/repos/FreeBSD.conf"

cat new-repo.txt

echo -e "${GREEN}Checking if ${FILE_PATH} exists${NC}"
if [ -e "${FILE_PATH}" ]; then
  echo -e "${GREEN}${FILE_PATH} exists. Appending to the file.${NC}"
  echo -e "${RED}Press Ctrl-C to cancel${NC}"
  sleep 3
  cat new-repo.txt >> "${FILE_PATH}"
else
  echo -e "${GREEN}${FILE_PATH} does not exist. Creating the file.${NC}"
  echo -e "${RED}Press Ctrl-C to cancel${NC}"
  sleep 3
  echo "FreeBSD: { enabled: no }" > "${FILE_PATH}"
  cat new-repo.txt >> "${FILE_PATH}"
fi

echo -e "${GREEN}Updating pkg${NC}"
pkg update

echo -e "${GREEN}Removing libtasn1${NC}"
pkg remove libtasn1

echo -e "${GREEN}Fetching libtasn1-4.18.0${NC}"
pkg fetch -y libtasn1-4.18.0

echo -e "${GREEN}Adding libtasn1-4.18.0${NC}"
pkg add /var/cache/pkg/libtasn1-4.18.0.pkg

echo -e "${GREEN}Installing ffmpeg${NC}"
pkg install -y ffmpeg

echo -e "${GREEN}If you see an ffmpeg output, you have successfully installed ffmpeg using libtasn1-4.18.0.pkg${NC}"
