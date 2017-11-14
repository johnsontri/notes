Batch Reinforce Learning
===============================================================================


Pure Batch RL
----------------------------------------------------------------------

Three phase

#. 在探索階段，蒐集 experience

    - purely random action

    - 視為 agent 不跟環境互動

    - experience set :math:`\mathcal F = \{(s, a, r', s') \dots\}`
      一堆 experience

#. Learning stage

    - experience set 的大小固定，且導入 prior

    - 根據 experience set 得出 optimal policy


#. Application


問題

    用 purely random (uniformed policy) 的效果不好，
    容易忽略掉 `重要` 的 state，如，在 goal state 附近的 states。


Growing Batch RL
----------------------------------------------------------------------

Modern batch RL 會在 pure batch 跟 pure online 之間找平衡點。


Foundations of Batch RL Algorithms
----------------------------------------------------------------------

原先的 Q-Learning 遇到的問題是，
Q 在小的 learning system，小的問題底下適用，
但是 Q 的 Q table 是 discrete，遇到較大的 state space 或是連續的 state space
無法應用。

大致上來說，遇到的瓶頸有三種：

- exploration overhead

- stochastic approximation 沒效率

- function approximation 不好收斂


Experience Replay
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

在原本 pure online 的 Q-Learning，會在 current optimal action
跟 exploration 之間選擇，像是 ϵ-greedy。
然後在觀測到下一個 state 之後，Q table 就馬上更新，這樣是 greedy 的，
得到的是 greedy policy。
往後的演算法中就忘了 transition tuple :math:`(s, a, r, s')`
（只看 update 後的 :math:`Q'(s, a)` table）。這是 "local" update

`experience replay` 的提出就是為了解決 `exploration overhead`.

這個 experience replay 的技術，雖然簡單，但被視為第一個用來解決 growing batch
problem 的技術。目的是為了加速收斂。

可以對於 experience，我們留多留少都可以，反正就設定個數字，
然後在跟系統的每一個互動後，我們有 n 跟 experience，那麼就 apply update rule
n 次（iter 過每個 experience）
這樣有 back-propagate 的意義在。


Stability Issues
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Idea of `Fitting`

Online RL 用 `asynchronous` updates，而且我們只更新我們目前的 state，
其他以前看過的 state 都不會動到。

Q table 是個 discrete case，我們 update 了某個 state-action pair，
而其他的都不會動到。

Idea of `Fitting` 是用 function approximation

.. math::

    f'(s, a) & = f(s, a) + \alpha(r + \max_{a' \in A} f(a', s') - f(s, a)) \\
             & = f(s, a) + \alpha(\bar{q}_{s, a} - f(s, a))

但是這個的收斂條件建立在特定的 update structure，e.g reward 的形式...etc。
這個吃工程上的經驗。

Fitting 的做法則是對 update rule 做改變。

Stable Function Approximation in Dynamic Programming
****************************************************

有些 function approximator 適合 TD methods 有些不適合，
這篇用 K-nearest-nieghbor, linear interpolation(?),
跟一些 local weight averaging 來做 approximation。
而且是有條件才收斂。

Algo:

#. 先抽 a set of :math:`s \in S` (state space)，先稱這個 set 為 :math:`A`.
   這些 :math:`s` 要具有代表性，能夠涵蓋整個 distribution。
   sampling 的原因是 state space 太大，要降低問題的難度。

#. Initial guess 的 value function :math:`V_0`

#. :math:`M_A` 是 learning algorithm，使用了 training set :math:`A`
   然後 :math:`f(A)` 是這個 training set 的 labels。

   .. math::

       M_A(f(A), A) \rightarrow \hat{f}

   :math:`M_A` 吃了 label 跟 training data 得到了一個 function approximator
   (e.g. a neural nets) :math:`\hat{f}`

#. 收斂的過程：

   .. math::

       V_0 & \\
       V_1 & \leftarrow M_A(V_0, A_0) & \\
       A_1 & \leftarrow T_A(V_1)      & \text{ (sampling)} \\
       V_2 & \leftarrow M_A(V_1, A_1) & \\
       \dots


