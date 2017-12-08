#!/bin/sh

err_exit()
{
	echo $1 >&2
	exit 1
}

ip_addr=$(echo $1 | egrep '\d+\.\d+\.\d+\.\d+')
if [[ -z $ip_addr ]]; then
	field_name=$(echo $1 | egrep -o '[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?')
	for dns_result in $(dig +short $field_name); do
		ip_addr=$(echo $dns_result | egrep '\d+\.\d+\.\d+\.\d+')
		[[ -n $ip_addr ]] && break
	done
fi

[[ -z $ip_addr ]] && err_exit '🛑 DNS address could not be found.
									And input accepted eg: [www.example.com | 192.168.1.1]'


address=$(wget -q "http://www.ip138.com/ips138.asp?ip=$ip_addr&action=2" -O - | iconv -f gb2312 -t utf8 | \
egrep '本站.*' | egrep -o -e '<li>.*</li>')

address=${address// /-}
for i in ${address//<\/li><li>/ }; do
	echo $i
done

# ip.cc
echo '\n\033[1;31m==> from ip.cc:'
curl -s cip.cc/$ip_addr
