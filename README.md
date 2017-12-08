# Utility

---

several little tools; sorted by coding language

#### Shell/01.iplookup

- look up detailed information of a domain name or ip address
- `iplookup [domain name | ip_addr]`

```
➜ sh Shell/01.iplookup.sh 192.30.253.113
<li>本站数据：美国-
参考数据1：美国弗吉尼亚州阿什本-github.com-
参考数据2：美国</li>

==> from ip.cc:
IP	: 192.30.253.113
地址	: 美国  弗吉尼亚州

数据二	: 美国 | 加利福利亚州旧金山Github公司

URL	: http://www.cip.cc/192.30.253.113
```
same with: `sh Shell/01.iplookup.sh github.com`

#### Shell/02.tra

- 'T'race 'R'oute with brief information of ip_'A'ddress
- `tra [ip_address]`

```
➜ sh Shell/02.tra.sh 192.30.253.113
traceroute to 192.30.253.113 (192.30.253.113), 64 hops max, 52 byte packets 
 5 33.108.120.106.static.bjtelecom.net (106.120.108.33)	=> 美国美国 defense.gov <
 6 237.235.120.106.static.bjtelecom.net (106.120.235.237)	=> 保留地址保留地址 <
 8 202.97.34.74    (202.97.34.74) 	=> 广东广州 电信<
   202.97.34.158   (202.97.34.158)	=> 中国 电信<
   202.97.34.74    (202.97.34.74) 	=> 广东广州 电信<
 9 202.97.14.206   (202.97.14.206)	=> 中国 电信<
   202.97.27.170   (202.97.27.170)	=> 中国 电信<
   202.97.28.126   (202.97.28.126)	=> 中国 电信<
10 202.97.51.66    (202.97.51.66) 	=> 美国加利福尼亚州圣何塞 电信<
   202.97.52.158   (202.97.52.158)	=> 美国加利福尼亚州圣何塞 电信<
   202.97.51.66    (202.97.51.66) 	=> 美国加利福尼亚州圣何塞 电信<
11 202.97.50.54    (202.97.50.54) 	=> 美国加利福尼亚州圣何塞 电信<
   202.97.50.78    (202.97.50.78) 	=> 美国加利福尼亚州圣何塞 电信<
12 xe-7-2-3.edge2.sanjose3.level3.net (4.53.210.109) 	=> 美国加利福尼亚州圣何塞 level3.com<
14 github-inc.bear1.washington111.level3.net (4.53.116.102) 	=> 美国华盛顿 level3.com<
   github-inc.bear1.washington111.level3.net (4.15.136.22)  	=> 美国华盛顿 level3.com<
17 lb-192-30-253-113-iad.github.com (192.30.253.113)	=> 美国弗吉尼亚州阿什本 github.com <
```
P.S.  1 ~ 4 hops not shown above are my private ip_address information
