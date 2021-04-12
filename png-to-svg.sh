#!/bin/bash
echo " The converter must be in the same folder as the png images"

echo "*********Case statement************"
echo "1 - Intall"
echo "2 - Run"

read num

case $num in
"1")
sudo apt-get install potrace imagemagick -y
;;
"2")
yourfilenames=`ls ./*.png`
i=0
for eachfile in $yourfilenames
do
  convert -flatten $eachfile output.pbm
  FILENAME=${eachfile##*/}
 
  potrace -s output.pbm -o $FILENAME.svg
  rm output.pbm
  ((i=i+1))
done
;;
*)
echo "Não compativel"
;;
esac