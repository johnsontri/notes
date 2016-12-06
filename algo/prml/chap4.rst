Classification
===============================================================================

Discriminant Function
----------------------------------------------------------------------

Two Classes
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    y(x) = \vec{w}^T x + w_0

:math:`w_0` is `bias`, sometimes a negative :math:`w_0` is called `threshold`


Perceptron
----------------------------------------------------------------------

Perceptron criterion

    分對的 :math:`w^T \fin(x_n) t_n > 0`

    E 用 SGD 去調，每個 iter 都調一次

證明 converge: :math:`E(w^(t+1)) < E(w)`

(4.57) 用 同除分子
(4.57) 即 sigmoid function

(4.72) 取 log 而來


Section name
----------------------------------------------------------------------

maximum likelihood

4.2.1 why gaussian?

what is share variance?


Discriminative Model
----------------------------------------------------------------------

直接假設 model 是 linear
maximum posterior


4.87

logistic function 是來自 posterior

(4.89) 是 likelihood 沒差，但是展開的 :math:`y_n` 是來自 posterior

(4.91) cross-entropy (?) 我們想讓 entropy 越小越好
(4.91) AKA cross-entropy error function


sigmoid function 微分 :math:`\frac{d\sigma}{da = \sigma(1-\sigma)}`


IRLS
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

用 Newton-Raphon method
是 二次近似

(而 Gradient Descent 是一次近似)
