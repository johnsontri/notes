Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift
============================================================================================

在 train DNN 的時候，每個 layer 的 input 都來自上個 layer，
但是這些 input 在每次 training 的 distribution 都長的不一樣。
造成遇到 activation function 的 output 很 non-linear 的狀況不好 train
（e.g. 我用 relu，但資料一堆 negative，造成 zero，很 non-linear）
；遇到我的 input 造成充滿 non-linear 的 case 會不好 train。

Ref
----------------------------------------------------------------------

https://arxiv.org/pdf/1502.03167.pdf
