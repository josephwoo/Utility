#!/bin/sh

# tra : trace route with address infomation ~
# address info supported by ip138.com

err_exit()
{
	echo $1 >&2
	exit 1
}

dest_ip=$(echo $1 | egrep '\d+\.\d+\.\d+\.\d+')
[[ -z $dest_ip ]] && err_exit '🛑 Input invalid ip_addr! Accept IP_Address, eg: [192.168.1.1]'


find_ip()
{
	address=$(wget -q "http://www.ip138.com/ips138.asp?ip=$ip_addr&action=2" -O - | iconv -f gb2312 -t utf8 | \
	egrep -o '数据1.*?<' )
	echo =\> ${address##*：}
}

format_routeinfo()
{
	echo $route_info | awk '{print $1}' | grep '\.' 1> /dev/null
	if [[ $? -eq 0 ]]; then
		echo $route_info | awk '{print $1,$2}' | xargs printf "   %-15s %-15s\t"
	else
		echo $route_info | xargs printf "%2s %-15s %-15s\t"
	fi
}

traceroute $dest_ip |
while read -r line
do
	route_info=$(echo $line | awk '{print $1,$2,$3}' )
	ip_addr=$(echo $route_info | egrep -m1 -o '\d+\.\d+\.\d+\.\d+' | head -n1)

	[[ -n $ip_addr ]] && format_routeinfo && find_ip
done

