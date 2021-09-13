import torch
import torch.nn as nn

# Input data
print('-------------------------------------------------------------------------------------')
inputs = torch.Tensor(1, 1, 39, 31)
print('\nInput Image Shape : {}'.format(inputs.shape))

# Convolution Layer & Max Pooling Layer
print('\n-------------------------------------------------------------------------------------')
conv1 = nn.Conv2d(1, 20, 4, padding=0)
print('\nConvolution Layer1')
print(conv1)

pool = nn.MaxPool2d(2)
print('\nMax Pooling Layer1')
print(pool)

conv2 = nn.Conv2d(20, 40, 3, padding=0)
print('\nConvolution Layer2')
print(conv2)

print('\nMax Pooling Layer2')
print(pool)

conv3 = nn.Conv2d(40, 60, 2, padding=0)
print('\nConvolution Layer3')
print(conv3)

print('\nMax Pooling Layer3')
print(pool)

conv4 = nn.Conv2d(60, 80, 2, padding=0)
print('\nConvolution Layer4')
print(conv4)

# Connecting Layers
print('\n-------------------------------------------------------------------------------------')
out = conv1(inputs)
print('\n\nOutput Data Shape of 1st Convolution Layer')
print(out.shape)

out = pool(out)
print('\nOutput Data Shape of 1st MaxPooling Layer')
print(out.shape)

out = conv2(out)
print('\nOutput Data Shape of 2nd Convolution Layer')
print(out.shape)

out = pool(out)
print('\nOutput Data Shape of 2nd MaxPooling Layer')
print(out.shape)

out = conv3(out)
print('\nOutput Data Shape of 3rd Convolution Layer')
print(out.shape)

out = pool(out)
print('\nOutput Data Shape of 3rd MaxPooling Layer')
print(out.shape)

out = conv4(out)
print('\nOutput Data Shape of 4th Convolution Layer')
print(out.shape)

out = out.view(out.size(0), -1)
print('\nFlatten Output Data Shape')
print(out.shape)

fc = nn.Linear(160, 100)
out = fc(out)
print('\nFully Connected Output Data Shape')
print(out.shape)
