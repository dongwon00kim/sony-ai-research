# Sony AI Research Code

This repository contains code related to research papers in the area of 
Machine Learning and Artificial Intelligence, that have been published by Sony. 
We believe in transparent and reproducible research and therefore want to offer 
a quick and easy access to our findings. Hopefully, others will benefit as much
from them as we did.


## Available Code

### [**Mixed Precision DNNs: All you need is a good parametrization**](https://openreview.net/forum?id=Hyx0slrFvH&noteId=Hyx0slrFvH&invitationId=ICLR.cc/2020/Conference/Paper2519) ([Code](./mixed-precision-dnns))
> Uhlich, Stefan and Mauch, Lukas and Cardinaux, Fabien and Yoshiyama, Kazuki and Garcia, Javier Alonso and Tiedemann, Stephen and Kemp, Thomas and Nakamura, Akira.
> Published at the 8th International Conference on Learning Representations (ICLR) 2020
> *arXiv technical report ([arXiv 1905.11452]( https://arxiv.org/abs/1905.11452))*

![](mixed-precision-dnns/imgs/bitwidth.png)


Efficient deep neural network (DNN) inference on mobile or embedded devices typically 
involves quantization of the network parameters and activations. 
In particular, mixed precision networks achieve better performance than networks 
with homogeneous bitwidth for the same size constraint. Since choosing the optimal 
bitwidths is not straight forward, training methods, which can learn them, 
are desirable. Differentiable quantization with straight-through gradients allows 
to learn the quantizer's parameters using gradient methods. We show that a suited 
parametrization of the quantizer is the key to achieve a stable training and a good 
final performance. Specifically, we propose to parametrize the quantizer with the 
step size and dynamic range. The bitwidth can then be inferred from them. 
Other parametrizations, which explicitly use the bitwidth, consistently perform worse. 
We confirm our findings with experiments on CIFAR-10 and ImageNet and we obtain mixed 
precision DNNs with learned quantization parameters, achieving state-of-the-art performance. 

### [**ALL FOR ONE AND ONE FOR ALL:IMPROVING MUSIC SEPARATION BY BRIDGING NETWORKS**](https://arxiv.org/abs/2010.04228) ([Code](./x-umx))
NNabla implementation of __CrossNet-Open-Unmix (X-UMX)__ is an improved version of [Open-Unmix (UMX)](https://github.com/sigsep/open-unmix-nnabla)  for music source separation. X-UMX achieves an improved performance without additional learnable parameters compared to the original UMX model. Details of X-UMX can be found in [our paper](https://arxiv.org/abs/2010.04228).

__Related Projects:__  x-umx | [open-unmix-nnabla](https://github.com/sigsep/open-unmix-nnabla) | [open-unmix-pytorch](https://github.com/sigsep/open-unmix-pytorch) | [musdb](https://github.com/sigsep/sigsep-mus-db) | [museval](https://github.com/sigsep/sigsep-mus-eval) | [norbert](https://github.com/sigsep/norbert)

## The Model

![](x-umx/imgs/umx-network-vs-x-umx-network.png)

As shown in Figure (b), __X-UMX__ has almost the same architecture as the original UMX, 
but only differs by two additional average operations that link the instrument models together. 
Since these operations are not DNN layers, the number of learnable parameters of __X-UMX__ is 
the same as for the original UMX and also the computational complexity is almost the same. 
Besides the model, there are two more differences compared to the original UMX. In particular, 
Multi Domain Loss (MDL) and a Combination Loss (CL) are used during training, which are different 
from the original loss function of UMX. Hence, these three contributions, i.e., (i) Crossing architecture, 
(ii) MDL and (iii) CL, make the original UMX more effective and successful without additional learnable parameters.


### [**Out-of-core Training for Extremely Large-Scale Neural Networks With Adaptive Window-Based Scheduling**](https://arxiv.org/abs/2010.14109) ([Code](./out-of-core-training))

This is the official implementation of [Out-of-core Training for Extremely Large-Scale Neural Networks With Adaptive Window-Based Scheduling](https://arxiv.org/abs/2010.14109).

We provide OoC feature as one of nnabla's utilities. You can enable OoC training on your nnabla script **with only a few additional lines**.
Please see the [document](https://nnabla.readthedocs.io/en/latest/python/api/lms.html) for more details!

![](./out-of-core-training/imgs/overview.png)
![](./out-of-core-training/imgs/result.png)

While large neural networks demonstrate higher performance in various tasks, training large networks is difficult due to limitations on GPU memory size. We propose a novel out-of-core algorithm that enables faster training of extremely large-scale neural networks with sizes larger than allotted GPU memory. Under a given memory budget constraint, our scheduling algorithm locally adapts the timing of memory transfers according to memory usage of each function, which improves overlap between computation and memory transfers. Additionally, we apply virtual addressing technique, commonly performed in OS, to training of neural networks with out-of-core execution, which drastically reduces the amount of memory fragmentation caused by frequent memory transfers. With our proposed algorithm, we successfully train ResNet-50 with 1440 batch-size with keeping training speed at 55%, which is 7.5x larger than the upper bound of physical memory. It also outperforms a previous state-of-the-art substantially, i.e. it trains a 1.55x larger network than state-of-the-art with faster execution. Moreover, we experimentally show that our approach is also scalable for various types of networks.