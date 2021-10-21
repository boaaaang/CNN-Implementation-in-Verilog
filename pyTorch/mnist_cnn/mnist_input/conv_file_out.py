import struct
import numpy as np
import matplotlib.pyplot as plt
import os
from PIL import Image

filename = "data/MNIST/raw/train-images-idx3-ubyte"
bin_file = open(filename, 'rb')
idx = 0

buf = bin_file.read()
magic, numImages, numRows, numColumns = struct.unpack_from('>IIII', buf, idx)
idx += struct.calcsize('>IIII')

if os.path.isdir("./extracted") :
    print('Save text files to ./extracted directory')
else:
    os.mkdir('./extracted') # make directory for output bitmap files
    print('Make ./exteracted directory and save text files')

#for image in range(0, numImages):
for image in range(0, 500):
    # the image is 28*28=784 unsigned chars
    im = struct.unpack_from('>784B', buf, idx)
    idx += struct.calcsize('>784B')
   
    # create a np array to save the image
    im = np.array(im, dtype='uint8')
    im = im.reshape(28, 28)

    np.savetxt("extracted/0_%s.txt" % image, im, fmt = '%02x', delimiter = ' ')

    im = Image.fromarray(im)
    im.save("extracted/0_%s.bmp" % image, "bmp")


