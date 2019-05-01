#!/usr/bin/env python3
# -*- coding: utf-8 -*-

'epc2md5'

__author__ = 'Zhenlin An'

import hashlib


hex2bin_map = {
    "0": "0000",
    "1": "0001",
    "2": "0010",
    "3": "0011",
    "4": "0100",
    "5": "0101",
    "6": "0110",
    "7": "0111",
    "8": "1000",
    "9": "1001",
    "a": "1010",
    "b": "1011",
    "c": "1100",
    "d": "1101",
    "e": "1110",
    "f": "1111",
}


def epc2md5(file):
    epc_list = []
    filename = file
    with open(filename, 'r') as raw_epc:
        for rows in raw_epc:
            epc = rows[0:len(rows)-1]
            # print(epc)
            # print(hashlib.md5(epc.encode('utf-8')).hexdigest())
            epc_list.append(hashlib.md5(epc.encode('utf-8')).hexdigest())

    with open(file+'-md5.txt', 'w') as md5out:
        for md5 in epc_list:
            # print(md5)
            md5out.writelines("".join(hex2bin_map[i] for i in md5)+"\n")
    print(1)

'''
def main():
    epc2md5('epc-1')


if __name__ == '__main__':
    main()
'''

