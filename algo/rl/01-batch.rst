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
