Overview
===============================================================================

我們關心 agent 跟環境的互動。
在 OR 領域， LR 被稱為 *approximate dynamic programming* 。
在 ML 才是 LR。 在 economic 用於對 有限理性(bounded rationality) 的研究。

在 ML 中，許多技術採用 Markov decision process (MDP), 這與 dynamic programming
的技術有關。


Reinforcement Learning and Markov Decision Processes
----------------------------------------------------------------------

#. 介於 supervised learning 與 unsupervised learning

#. 處理 sequential decision making problem

#. environment 用來控制 system state ，其通常被表示成 actions + states 的集合。

#. "sequential decision making can be viewed as instances of MDPs."

#. `policy` a function maps state into actions.

#. 各種對 decision making problem 的解法
   * rule base -- 全部 programming 出來，窮舉

   * search and planning

   * probabilistic planning algorithms

   * learning

#. Online -- 拿個實際的環境來操作

#. Offline -- 使用 *simulator*


Credit Assignment
----------------------------------------------------------------------

我的機器做了個決定，但是這個決定對後面影響大；
整個 training 過程可能要到結束你才會知道 credit 。
可能前面的決定 contribute 比較多。
我能不能先給 credit ?

*temporal credit assignment* problem

*structural credit assignment* problem (?)
agent 的 policy 可以用 任意 function 表示時， e.g. NN 的 params
這個時候 如何 update NN 的參數便是 structural credit assignment problem


Exploration-Exploitation Trade-off
----------------------------------------------------------------------

Exploration 為了找到新招

Exploitation 有招之後的優化


Performance
----------------------------------------------------------------------


- RL 的 performance measurement 是 stochastic, policy 一直 update

  *concept drift*

- supervised/unsupervised learning 的 data prieror distribution 你都知道。

- 注意 subgoals


Markov Decision Process
----------------------------------------------------------------------

- 可以被視為 stochastic extension of finite automata

- 雖然廣義上的 MDP 是 infinit

- key componement

    - states

    - actions

    - transitions

    - reward function


States
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

A finite set :math:`S = \{s^1, \dots, s^N\}`

The size of set space is :math:`N`. :math:`\| S \| = N`

use `features` to describe a `state`


Actions
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

A finite set :math:`A = \{a^1, \dots, a^K\}`

:math:`\| A \| = K`

Actions can control the system states.

一坨 action 對某個 state 操作: :math:`A(s)`

描述 action `order`, 使用 `global clock` :math:`t = 1, 2, \dots`


Transitions
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Apply action :math:`a` in a state :math:`s`, make a transitions
from :math:`s` to new state :math:`s'`

Transition function :math:`T` define as
:math:`S \times A \times S \rightarrow [0, 1]`

Notation: 現在是 :math:`s`, apply :math:`a` action, 得到 :math:`s'`

.. math::

    T(s, a, s')

:math:`T` 形成機率分佈, `probability distribution over possible next states`

(如果是離散的也可以想成是一張表)

.. math::

    \sum_{s' \in S} T(s, a, s') = 1


Reward Function
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

在某個 state 上，我有多少 reward

.. math::

    R: S \rightarrow \mathbb{R}

通常有 :math:`\gamma \in [0, 1]` 作為 discount factor,
離某 :math:`s` 越遠的 reward discount 越多。


Initial State distribution
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Initial state 落在哪裡的表

.. math::

    I: S \rightarrow [0, 1]


Model
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

即 :math:`T` 跟 :math:`R`


Task
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- finite, fixed horizon task

- infinite horizon task

- continuous task


Policy
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- deterministic policy: 就直接的 mapping

.. math::

    \pi: S \rightarrow A

- stochastic policy: 給 :math:`s,\ a` output 機率

.. math::

    \pi: S \times A \rightarrow [0, 1]


在整個 process 中，如果 policy function 都沒變動，那麼就是 stationary


Optimality
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

agent 的目的是啥、想要啥形狀的 reward，average 平穩的 or ？
通常是獲得儘可能多的 rewards, 且夠有效率。

optimality 是 整個 process reward 的期望值, reward 的算法可以直接 sum,
導入 discount, 或是採用 一個 process 的 average rewards.

Finite horizon: 我希望在 h 步之內(即 finite horizon) 有最大的 rewards.
`h-step optimal action`

.. math::

    E[ \sum_{t=0}^h r_t ]

導入 discount 的 finite horizon:

.. math::

    E[ \sum_{t=0}^h \gamma^t r_t ]

Sepcial case of discount finite horizon model: Immediate reward

.. math::

    \text{Let}\ \gamma = 0

    E[r_t]


導入 discount 的 infinite horizon:

.. math::

    E[ \sum_{t=0}^\infty \gamma^t r_t ]


Value Function
----------------------------------------------------------------------

link `optimality` and `policy`.

algo learning target:

* value function, aka criti-based algorithms

    * Q-Learning

    * TD-Learning

* actor-based algorithms

當我的 agent 停在某個 state 時，多好？ (`how good` in certain state)

`多好` 這件事情用 optimality criterion 表達， e.g. average rewords
    "The notion of how good is expressed in terms of an optimality criterion,
    i.e. in terms of the expected return."

所以 :math:`\pi` 是 hyper parameter? 要先給定
    "Value functions are defined for particular policies."

input 是 :math:`s` ， :math:`\pi` 是已知
    "value of a state :math:`s` under policy :math:`\pi`"

.. math::

    V^\pi(s)

e.g. 假設 optimality 是 finite-horizon, discounted model,
given policy :math:`\pi`, 且正在 state :math:`s`

.. math::

    V^\pi(s) = E_{\pi}[ \sum_{k=0}^h \gamma^k r_{t+k} | s_t = s ]

看到 :math:`r_{t+k}` 代表前面已經過了 :math:`t` ，前面就不管了。
我們只關心往後的 :math:`k` 步


Reference
----------------------------------------------------------------------

* https://en.wikipedia.org/wiki/Reinforcement_learning
