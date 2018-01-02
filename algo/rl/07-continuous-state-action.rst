Reinforcement Learning of Continuous State and Action Spaces
===============================================================================

本章主要介紹
    - 直接 update value function `representation` 的方法

    - 直接 update policy function `representation` 的方法

對於 function representation 的選擇有各種考量，然後選好 representation 後
還有 update (optimization) 的方法 -- gradient-based and gradient-free method。

    - gradient-based TD learning

    - evolutionary

    - policy-gradient

    - actor-critic


Intro.
----------------------------------------------------------------------

Problem setting: sequential decision making in
    - continuous domain
    - delayed reward


MDP in Continuous Spaces
----------------------------------------------------------------------

架設我們的 state space :math:`S` 是 infinitely large

Transition probability 的 PDF，就是對 :math:`s'` 積分

.. math::

    \int T(s, a, s') d s' = P(s' | s, a)

也有另一種 form:

.. math::

    s' = T(s, a) + \omega_T(s, a)

這裡的 :math:`T` 訂成一個 deterministic function
:math:`T: S \times A \rightarrow S`,
:math:`\omega_T` 是個 zero-mean 的 noise vector。
上面這種新式的物理意義是，
我可以從「以 :math:`T(s, a)` 為中心的 Gaussian」 sample 出我的 :math:`s'`

