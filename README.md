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

설치 후 아나콘다 프롬프트에서 버전 확인이 가능합니다.

```sh
import torch
torch.__version__
```
