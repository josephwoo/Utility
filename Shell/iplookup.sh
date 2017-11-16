#!/bin/sh

err_exit()
{
	echo $1 >&2
	exit 1
}

field_name=$(echo $1 | egrep -o '(www\.)[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?')
if [[ $field_name != $1 ]]; then
	ip_addr=$(echo $1 | egrep '\d+\.\d+\.\d+\.\d+')
	[[ -z $ip_addr ]] && err_exit '🛑 Input invalid! accept eg: [www.example.com | 192.168.1.1]'
else
	ip_addr=$(nslookup $field_name | egrep -o '\d+\.\d+\.\d+\.\d+' | tail -n 1)
	if [[ $(echo $ip_addr | egrep '\d+\.\d+\.\d+\.\d+') != $ip_addr ]]; then
		err_exit '🛑 DNS no result ip_addr'
	fi
fi

address=$(wget -q "http://www.ip138.com/ips138.asp?ip=$ip_addr&action=2" -O - | iconv -f gb2312 -t utf8 | \
egrep '本站.*' | egrep -o -e '<li>.*</li>')

address=${address// /-}
for i in ${address//<\/li><li>/ }; do
	echo $i
done

# ip.cc
echo '\n\033[1;31m==> from ip.cc:'
curl -s cip.cc/$ip_addr
