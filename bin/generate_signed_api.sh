timeStamp=`date +%s`
echo "timeStamp=$timeStamp"

(( length=timeStamp%16+10 ))
echo "length=$length"

secret="ngxway"
sign="${timeStamp}_${secret}_${timeStamp}"
echo "sign=$sign"

signMd5=`md5 -s ${sign} | awk '{ print $4 }'`
echo "signMd5=$signMd5"

result=${signMd5: 0: $length}
echo "result = " $result

echo "url = 127.0.0.1:8090?sign=${result}&timestamp=${timeStamp}"
