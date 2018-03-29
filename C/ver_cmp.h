 /*************************************************************************
    > File Name: ver_cmp.h
	> Author: Joenan
	> Mail: joenan.woo@gmail.com
 	> Created Time: Thu Feb  1 01:16:47 2018
************************************************************************/

#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAXVERCHAR 16

/*
 * format version.
 * eg: 001.0210.00304 => 1.210.304
 * ignored the case of characters that contain `non-numbers' (letters, spaces) ...
*/
static void fmt_ver(const char *, char *);

/*
 * Negative value if ver1 older than ver2.
 * Zero if ver1 and ver2 compare equal.
 * Positive value if ver1 newer than ver2.
*/
static int ver_cmp(const char *cst_ver1, const char *cst_ver2)
{
    char ver1[MAXVERCHAR], ver2[MAXVERCHAR];
	fmt_ver(cst_ver1, ver1), fmt_ver(cst_ver2, ver2);
//    printf("fmt_ver1 = %s \nfmt_ver2 = %s\n", ver1, ver2);

	char sub_ver1[MAXVERCHAR], sub_ver2[MAXVERCHAR];
	int sub_len1 = 0, sub_len2 = 0;

	for (int i1 = 0, i2 = 0; 
		ver1[i1] != '\0' || ver2[i2] != '\0';
		++i1, ++i2) {
		if (ver1[i1] == ver2[i2]) {
            continue;
        }

        if ('\0' == ver1[i1]) {
            return -1;
        } else if ('\0' == ver2[i2]) {
            return 1;
        } else if ('.' == ver1[i1]) {
            return -1;
        } else if ('.' == ver2[i2]) {
            return 1;
        }

        while ( isdigit(ver1[i1]) ) {
            sub_ver1[sub_len1++] = ver1[i1 ++];
        }

        while ( isdigit(ver2[i2]) ) {
            sub_ver2[sub_len2++] = ver2[i2 ++];
        }
        break;
	}

	if (sub_len1 || sub_len2) {
		if (sub_len1 == sub_len2) {
			return strcmp(sub_ver1, sub_ver2);
		} else {
			return sub_len1 - sub_len2;
		}
	}

	// same
	return 0;
}


static void fmt_ver(const char *src, char *ver_fmted)
{
	if (!strlen(src)) { return; }

    int idx_fmted = 0;

	for (int idx_src = 0; src[idx_src] != '\0'; ++ idx_src) {
		if ( '0' == src[idx_src] && 
			('.' == src[idx_src-1] || 0 == idx_src) ) {
            while ('0' == src[++ idx_src]);
		}

        ver_fmted[idx_fmted ++] = src[idx_src];
	}

	ver_fmted[idx_fmted] = '\0';
}
