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

假設我們的 state space :math:`S` 是 infinitely large

Transition probability 的 PDF，就是對 :math:`s'` 積分

.. math::

    \int T(s, a, s') d s' = P(s' | s, a)

也有另一種 form：

.. math::

    s' = T(s, a) + \omega_T(s, a)

這裡的 :math:`T` 訂成一個 deterministic function
:math:`T: S \times A \rightarrow S`,
:math:`\omega_T` 是個 zero-mean 的 noise vector。
上面這種新式的物理意義是，
我可以從「以 :math:`T(s, a)` 為中心的 Gaussian」 sample 出 :math:`s'`
然後我的 reward function 也可以加上 noise：

.. math::

    r' = R(s, a, s') + \omega_R(s, a, s')

上面 :math:`T` 跟 :math:`R` 帶著 :math:`\omega_T` 、 :math:`\omega_R` 的形式，
是 general form；如果 :math:`\omega` 在所有的 timestamps 中都是 0。
那麼整個 MDP 就是 deterministic，反之為 stochastic。

如果 :math:`T` 跟 :math:`R` 有 time-dependent，要導入 t 做考慮，
那麼這個 MDP 是 non-stationary。

Case I: action space 是離散的
    只有 state space 是 continuous。
    Policy :math:`\pi: S \times A \rightarrow [0, 1]` 長這樣：

    .. math::

        \pi(s, a) & = P(a | s) \\
        \sum_{a \in A} \pi(s, a) & = 1

Case II: action space 是 continuous
    用 :math:`\pi(s)` 的 PDF，從 :math:`\pi(s, a)` 對 action 積分，
    積出來的 function 就是在 action space 上的 PDF。

Value function 的目的是 predict `future discounted reward` 。
而 optimality 就是 最大化 reward。

:math:`B^\pi` 是 Dynamic Programming Operator，
given :math:`\pi` 後 :math:`B^\pi: \mathscr{V} -> \mathscr{V}`
where :math:`\mathscr{V}` is the space of value function。
這個 operator 吃一個舊的 value function 會吐出新的 value function。

.. math::

    (B^{\pi_i} V)(s) & = \int_A \pi(s, a)
        \Big( \int_S T(s, a, s') (R(s, a, s') + \gamma V(s')) ds' \Big) da \\
    \therefore \lim_{i \to \infty} (B^{\pi_i}V)(s) & = \\
    (B^* V)(s) & = \max_a \int_S T(s, a, s') (R(s, a, s') + \gamma V(s')) ds'


