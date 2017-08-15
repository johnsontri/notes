Linear Transform
===============================================================================

Ref: Chap 6

有個 function 可以 map 兩個 vector space: :math:`V` and :math:`W`.

.. math::

    T: V \rightarrow W

* V 是 T 的 domain

* W 是 T 的 codomain

.. math::

    T(\vec{v}) = \vec{w}


* :math:`\vec{w}` 是 `image`

* 所有可以 output :math:`\vec{w}` 的 :math:`\vec{v}` 形成的 set: `preimage` of
  :math:`\vec{w}`


Definition
----------------------------------------------------------------------

:math:`V,\ W` 是 vector space

.. math::

    T: V \rightarrow W

而且滿足

1. :math:`T(\vec{u} + \vec{t}) = T(\vec{u}) + T(\vec{t})`

2. :math:`T(c \vec{u}) = c T(\vec{u})`


然後就會有好用的性質 (P.294)


Counterexample
**************************************************

:math:`\sin` function 不是 Linear Transform

.. math::

    \sin((\frac{\pi}{2}) + (\frac{\pi}{3}))
    \neq \sin(\frac{\pi}{2}) + \sin(\frac{\pi}{3})


Matrix Form
----------------------------------------------------------------------

.. math::

    T(\vec{v}) = A \vec{v}


根據 :math:`A` 的 shape ，如： :math:`(3, 2)` ， 那麼知道

.. math::

    T: R^2 \rightarrow R^3


拿到一個 :math:`\vec{v}` 想要知道 image ，直接做矩陣乘法 :math:`A\vec{v}`
即可。
