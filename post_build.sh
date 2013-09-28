date=`date +%m-%d-%Hh%M`
name=sbreview-$date.pdf

cp _build/sbreview.pdf $name
url=`cloudapp $name | tail -n 1`
echo "* [$date]($url)" >> README.md
rm $name
