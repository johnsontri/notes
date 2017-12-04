Linear Model for Regression
===============================================================================

Linear Basis Function Models
----------------------------------------------------------------------

原始的出發點是簡單的 polynomial

.. math::

    y(\vec{x}, \vec{w}) & = w_0 + w_1 x_1 + \dots + w_D x_D \\
                        & = \vec{w} \cdot \vec{x}

Extend 這個 model 成

.. math::

    y(\vec{x}, \vec{w}) & = w_0 + w_1 \phi_1(\vec{x}) + \dots + w_D \phi_D(\vec{x}) \\
                        & = w_0 + \sum_{i=1}^D w_i \phi_i (\vec{x})

在化簡單一點，
let :math:`\phi_0 (\vec{x}) = 1`

.. math::

    y(\vec{x}, \vec{w}) = \vec{w} \cdot \vec{\phi}(\vec{x})

對比一開始最簡單的 linear model，
x 是 scalar，還不是 vector ，
就是 let :math:`\phi_i(x) = x^i` 的結果。

