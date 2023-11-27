# ffmpeg-6.0.1-FreeBSD
After upgraded, the new libtasn1-4.19 package has caused issues and broke ffmpeg. The following script can be used to revert the libtasn1 package back to version 4.18, ensuring compatibility with ffmpeg.


# How to use
1. git clone https://github.com/gyferlim/ffmpeg-6.0.1-FreeBSD
2. cd ffmpeg-6.0.1-FreeBSD
3. chmod +x run.sh
4. ./run.sh

# What is inside
1. add http://pkg.FreeBSD.org/${ABI}/release_1 as a repo
2. pkg update
3. remove newer/current libtasn1 if any
4. fetch libtasn1-4.18.0
5. add libtasn1-4.18.0
6. install ffmpeg
