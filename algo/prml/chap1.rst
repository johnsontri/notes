Introduction
===============================================================================

- pattern recognition 聚焦在 自動 discover rules, regularities of data.


- Common symbol

    - data point :math:`vec{x}`

    - target vector :math:`vec{t}`

    - result of ML algo :math:`vec{y}(vec{x})`

- `generalization`: 分辨的成功率

- `feature extraction`: data pre-processing.


Regularization
----------------------------------------------------------------------

One of technique to control over-fitting. Simply add a penalty term to
the error function.

.. math::

    E(\vec{w}) = \text{squart error} + \text{regularization}


.. math::

    \text{regularization} = \frac{\lambda}{2} \|\| \vec{w} \|\|^2

通常會忽略 w_0, w_0 圖上位移的常數。

- 上述做法統計學上叫做 *shrinkage*
- Neuro network 裡叫做 *weight decay*
