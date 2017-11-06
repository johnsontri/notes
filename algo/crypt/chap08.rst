Chapter 8: More about Number Theory
===============================================================================

Fermat's and Euler's Theorems
----------------------------------------------------------------------

Fermat's Theorem
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:math:`p` 是質數
找另一不被 :math:`p` 整除只正整數 :math:`a`

則 :math:`a^{p-1} \mod p = 1` (餘數是 1

或 :math:`a^p \mod p = a \mod p`


Euler's Totient Function
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    \phi(n)

小於 n 的正整數中 跟 n 互質的數量

:math:`\phi(8) = 4`

:math:`\phi(37) = 36`

如果有兩相異質數 :math:`p, q`

.. math::

    \phi(pq) = \phi(p) \times \phi(q) = (p - 1)(q - 1)

所以

.. math::

    \phi(21) = \phi(3 \times 7) = \phi(3) \times \phi(7) = (3 - 1)(7 - 1) = 12


Euler's Theorem
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:math:`a, n` 互質

.. math::

    a^{\phi(n)} \equiv 1 (\mod n)

意思就是

.. math::

    a^{\phi(n)} \mod n = 1


alternative form

.. math::

    a^{\phi(n) + 1} \equiv a (\mod n)


Testing for Primality
----------------------------------------------------------------------

Miller-Rabin Algorithm
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

property of prime

First property:
:math:`p` is a prime, :math:`n < p, n \in \mathbb{N}`

.. math::

    (a \mod p) \times (a \mod p) = (a^2 \mod p)


Given

.. math::

    a \mod p & = 1 & (\text{or})\\
    a \mod p & = -1

iff

.. math::

    a^2 mod p = 1
