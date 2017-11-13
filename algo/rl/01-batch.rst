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


