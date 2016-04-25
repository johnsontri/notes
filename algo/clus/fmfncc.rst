Fast Methods to Find Nearest Cluster Centers
===============================================================================

e.g. k-means or VQ

Definition
    :math:`k` = # of clusters = codebook size
    :math:`\text{codebook } = \{ \vec{y_1}, \dots, \vec{y_n} \}`

Definition
    :math:`\vec{x} = (x_1, ... , x_16)` 是個 16 維的新資料點


Goal
.. math::
    min \| \vec{y_i} - \vec{x} \| ^2
    =
    min [ \sum_{j = 1}^{16} (y_{ij} - x_j)^2 ],
    i = 1, 2, .\dots, 128




假設到目前為止，已有某些 centroid 被檢查過。
e.g. 已查過 :math:`\vec{y_1} \vec{y_2}` 。
到目前為止最靠近 :math:`\vec{x}` 的平方誤差是

.. math::

    d^{2 (current)}_{min} = \| \vec{x} - \vec{y^{current}_{min}} \| ^2 =
    min \| \vec{x} - \vec{y_l} \| ^2,
    \vec{y_l} \in \{ 已檢查過 \}

問題：對下一個待檢查的 :math:`\vec{y_i}` ，應該老老實實的計算
:math:`\| \vec{y_i} - \vec{x} \| ^2` ?

Partial Distance Elimination
----------------------------------------------------------------------

1985 PDE Method

.. math::

    If (y_{i1} - x_1) ^ 2 + (y_{i2} - x_2) ^ 2 + (y_{i3} - x_3) ^ 2 >
    d^{2 (current)}_{min}

就不用繼續算下去


TIE Method
----------------------------------------------------------------------

三角不等式消除法

Pre-Processing: 先記錄 O(k^2) = 128x127/2 = C^n_2 組距離

Main: 只要

.. math::

    \| \vec{y_i} - \vec{y^{current}_{min}} \| >= 2 d^{current}_{min}

就保證 :math:`\vec{y_i}` 不可能更接近 :math:`\vec{x}`

Proof
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

三角形的兩邊合大於第三邊

::

    _
       \vec{x}
       /
      /
     /
    \vec{y^{current}_{min}}
     \
      \
       \ \vec{y_i}

.. math::

    \| \vec{y_i} - \vec{x} \| >=
    | \| \vec{y_i} - \vec{y^{current}_{min}} \| -
      \| \vec{y^{current}_{min}} - \vec{x}   \|
    |
    = | >= 2 d^{current}_{min} - d^{cur}_{min} |
    >= (2 - 1) d^{cur}_{min} =
    \| \vec{y^{cur}_{min}} - \vec{x} \|

IEEE-T-Com
----------------------------------------------------------------------

1994 Torres & Huguel

若每一維都 >= 0

.. math::

    If \| \vec{x} \| ^2 + \| \vec{y_i} \| ^2 -
    2 (\vec{y_i})_max ( \sum_1^{16} x_j ) >= d^{2 cur}_{min}

    or

    If \| \vec{x} \| ^2 + \| \vec{y_i} \| ^2 -
    2 (\vec{x})_max (\sum^16_{j=1} y_{ij}) >= "

    where X_max = max {x_1, x_2, \dotss, x_16} = \| \vec{x} \|_{infinit}

    where 先算好 3 x 128 個zhi


則 \vec{y_i} 不可能小於 \vec{y^{cur}_{min}}
