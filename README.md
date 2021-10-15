# CNN Implementation in Verilog
> Implementation of Convolution Neural Network using Python & Verilog

성균관대학교 소프트웨어학과 & 전자전기공학부 강보영 졸업작품

## Environment Setting

### Python Installment
https://www.python.org/

### Anaconda Installment
https://www.anaconda.com/

### PyTorch Installment
https://pytorch.org/

파이토치는 앞서 설치한 아나콘다 버전/OS/플랫폼에 따라 다르므로 위 링크에서 확인 후 설치합니다.

```sh
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c conda-forge
```

설치 후 아나콘다 프롬프트에서 버전 확인이 가능하다.

```sh
import torch
torch.__version__
```

### Modelsim Installment
https://eda.sw.siemens.com/en-US/modelsim-student-edition-unavailable/

해당 프로젝트는 21.1 버전 환경에서 개발되었다.

## MNIST DataSet Learning using PyTorch

채택한 CNN의 구조는 아래의 2-Layer이며, 파라미터는 아래와 같이 설정하였다.
+ Batch Size = 64
+ Training Epoch = 10
+ Learning Rate = 0.01
+ Optimizer = Stochastical Gradient Descent (Momentum = 0.5)
+ Activation Function = ReLU

![image](https://user-images.githubusercontent.com/43449786/137171059-f6d9abc2-dd1f-4d81-a812-ed5cde8c7274.png)

학습 결과 96.29%의 적중률을 보였다.

![image](https://user-images.githubusercontent.com/43449786/137170572-42f53f74-4a5c-482a-86f2-8933a9994bf7.png)

## Verilog Design

### Block Diagram
![image](https://user-images.githubusercontent.com/43449786/137170969-66a50f9b-7281-498e-aee0-661c4b637e04.png)


