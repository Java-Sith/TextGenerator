import numpy as np
import cv2
import os


def split(word):
    chars = [char for char in word]
    for x in range(len(chars)):
        chars[x] = 255 * (chars[x] - 48)
    return chars


def generateImage(file):
    N = 250
    data = file.read(N * N).split()
    matrix = []
    for i in range(len(data)):
        splitData = split(data[i])
        matrix.append(splitData)
    matrix = np.matrix(matrix, np.uint8)
    cv2.imshow('SongImg', matrix)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


if __name__ == '__main__':
    os.system("nasm -felf64 -o TextGenerator.o TextGenerator.asm")
    os.system("ld -o TextGenerator TextGenerator.o")
    os.system("./TextGenerator")
    file = open('/home/zuckerberg/Escritorio/Github/TextGenerator/Song.bin', 'rb')
    generateImage(file)
    # matrix = open('/home/zuckerberg/Escritorio/Github/TextGenerator/1file.bin', 'rb')
    # data = matrix.read(N*N)
    # data = colorBits(data).encode()
    # print(type(data))
    # #print(data)
    # img = open("/home/zuckerberg/Escritorio/Github/TextGenerator/Img1file.png", "wb")
    # img.write(base64.b64decode(data))
    # img.close()
