Introduction
===============================================================================

- pattern recognition 聚焦在 自動 discover rules, regularities of data.


- Common symbol

    - data point :math:`\vec{x}`

    - target vector :math:`\vec{t}`

    - result of ML algo :math:`\vec{y}(\vec{x})`

- `generalization`: 分辨的成功率

- `feature extraction`: data pre-processing.


Regularization
----------------------------------------------------------------------

One of technique to control over-fitting. Simply add a penalty term to
the error function.

.. math::

    E(\vec{w}) = \text{squart error} + \text{regularization}


.. math::

    \text{regularization} = \frac{\lambda}{2} \| \vec{w} \|^2

通常會忽略 w_0, w_0 圖上位移的常數。

- 上述做法統計學上叫做 *shrinkage*
- Neuro network 裡叫做 *weight decay*


Probability Theorem
----------------------------------------------------------------------

- random variable is a *function*, e.g `X`, output can be `foo` or `bar`.

- Two rules:

    - sum rule

    - product rule

.. math::

    p(X=foo) -> 0.4;
    p(X=bar) -> 0.6.

    p(foo) + P(bar) = 1.


Joint Probability
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:X: a random var, possibile outcome is :math:`\{ a, b, c \}`

:Y: a random var, :math:`\{ foo, bar, baz \}`

:N: total number of trails

:math:`n_{ij}`: the number of :math:`X_i` + # of :math:`Y_j`

:joint probability:

.. math::

    p(X=x_i, Y=y_j) = \frac{n_{ij}}{N}

e.g.

.. math::

    p(X=x_a, Y=y_{bar}) = \frac{n_{a-bar}}{N}

即出現 `a` ，同時出現 `bar` 之機率。
:math:`X` 與 :math:`Y` 可能是兩個獨立的事件。


:marginal probability: or says *sum rule*

.. math::

    p(X=x_i) = \sum_j p(X=x_i, Y=y_j)


Condiction Probability
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Given :math:`X = x_i`

.. math::

    p(Y=y_j|X=x_i) = \frac{n_{ij}}{n_i}


Product Rule
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    p(X=x_i, Y=y_j) & = p(Y=y_j|X=x_i) p(X=x_i) \\
                    & = p(X=x_i|Y=y_j) p(Y=y_j)


Bayes' Theorem
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    p(Y|X) = \frac{p(X|Y)p(Y)}{p(X)}

- 分母已知而且是 const, 可以視為一個 normalization term 。
  讓所有 :math:`p(y_i|X)` 符合機率公設。


.. math::

    \because
    p(X, Y) & = p(Y, X)
    \\
    p(Y|X)p(X) & = p(X|Y)p(Y)
    \\
    \therefore
    p(Y|X) & = \frac{p(X|Y)p(Y)}{p(X)}


Example
**************************************************

給定 :math:`x_i` 是實驗中的已知。我們關心 :math:`Y` 的結果。

:prior probability: 事前機率。
    在還沒實驗之前，我們還沒有拿到任何已知( :math:`x_i` )時，
    我們所關心的那個 :math:`Y` 的機率。

.. math::

    p(Y)


Likelihood
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    Likelihood = p(x_i|y_j)

The :math:`x_i` is the given outcome.
