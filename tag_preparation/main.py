import epc2md5
import gen_test_EPC

def main():
    # print('start')
    filename = 'EPC_70.txt'
    gen_test_EPC.gen_test_EPC(filename)
    epc2md5.epc2md5(filename)


if __name__ == '__main__':
    main()