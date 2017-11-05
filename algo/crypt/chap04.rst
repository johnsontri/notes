Number Theory
===============================================================================

Groups
----------------------------------------------------------------------

.. math::

    \{G, \cdot \}

一個 set 加上一個 binary operation 是一個 Group


Rings
----------------------------------------------------------------------

.. math::

    \{R, +, \times \}

一個 set 加上一個 addition operator，一個 multiplication operation


Fields
----------------------------------------------------------------------

.. math::

    \{F, +, \times \}

一個 set 加上一個 addition operator，一個 multiplication operation
滿足最多的 axioms。

.. note::

    integer 這個 set 不是 field，因為不滿足 multiplication inverse。

    3 跟 :math:`\frac{1}{3}`，但 :math:`\frac{1}{3}` 不在 integer 這個 set 裡面


Finite Fields
----------------------------------------------------------------------

在 cryptography，我們有興趣的是 finite field。
而這個 finite field 的 order（即 ``length(F)`` ）
一定是 :math:`p^n`, where :math:`p` is a prime, :math:`n \in \mathbb{N}`.

稱為 Galois Field

.. math::

    GF(p^n)


The set with modulo arithmetic operations denote as :math:`GF(p) = Z_n`
這個 n 一定要是 prime 才會構成裡面的每個 element 都有 multiplication inverse，
因為要裡面的 element 要跟 n 互質。所以寫作

.. math::

    Z_p
