Probability Distributions
===============================================================================

density estimation
    給定一個 random variable :math:`X`, random variable is a function,
    然後有 :math:`x_1, x_2, \dots, x_n` 已觀測的值。我們想要找到
    probability distribution :math:`p(X)`

Assumption
    常用 data points 之間為 i.i.d. (independent and identically distribution)

ill-posed problem
    *density estimation* problem 基本上是 ill-posed --
    無限多種 probability distribution 符合這有限的觀測值。
    所以需要注重 model selection

parametric distribution
    這些 distribution 是透過參數來控制形狀，不是 data；形狀早就決定了

non-parametric density estimation
    解決 parametric distribution 的限制， distribution 的形狀用 data set 決定；
    data set 也要夠大。

