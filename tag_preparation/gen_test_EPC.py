#!/usr/bin/env python3
# -*- coding: utf-8 -*-

'generate test EPC file'

__author__ = 'Zhenlin An'


def gen_test_EPC(file):
    common_EPC = '300833B2DDD901400000'
    start = '183'
    EPC = []
    for i in range(71):
        EPC.append(common_EPC + '0'+hex(int(start,16) + i)[2:])
    with open(file, 'w') as file:
        for each in EPC:
            file.writelines(each + '\n')

    return EPC
