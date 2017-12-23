Learning and Using Model
===============================================================================

與 model-free (direct) RL 相對應。
Model-based (indirect) method 是去學習環境 model :math:`T(s, a, s')` 跟 :math:`R(s, a, s')`
in online manner.

Model 學完了之後，我就得到 optimal solution 了，就不用跟環境互動了。
Model-based 在處理 exploration 上面會有比較好的效率，
因為我可以看著我估測出來的 model 精心策劃一個 exploration path。

這個系列舉例來說有 `value iteration` 跟 `Monte Carlo Tree Search` 。

Model learning 的方法也是各異

- build from scratch

- or parametric

- etc...

Sample efficient: take fewer action to learn than model-free RL

舉例來說 model-based 只要 sample 出了 goal state，就會拿著這個 sample
往回 propagate 回去其他的所有相關的 state。
Model-free RL 沒這個特性，要多嘗試幾次。
這個 sample efficient 特性的代價就是，computation cost 跟 memory cost
比較高。

另一個特性是 `targeted exploration` 。
Model-based 的 agent 有足夠的資訊去針對特定 state 做 exploration，
以及跳過雜訊。


What is a Model?
----------------------------------------------------------------------

MDP model.

Tabular maximum likelihood.
導入 counter :math:`C(s, a, s')` and :math:`C(s, a)`,
對看過的 :math:`(s, a, s')` 。

對 :math:`s'` 就可以導入 freq 的方法

.. math::

    P(s' | s, a) = T(s, a, s') = \frac{C(s, a, s')}{C(s, a)}

Sampling 中得到的 sum of reward :math:`\sum R`,
假設這邊寫成 :math:`R_\sum` 。
所以 對某個 state-action pair 的 expected reward，就算算 mean

.. math::

    R(s, a) = \frac{R_\sum (s, a)}{C(s, a)}

上面就是最直白的 tabular model learning。

其實整個 Model learning method 可以被視為 supervise learning。
是對 :math:`(s, a)` 為 input，output 是 :math:`s', r`
的 supervise learning。

One of easiest model-based RL: Locally weighted Regression.
就是把 experience 存起來，丟一個新的 state-action 進來後，
做附近的 state-action 的 weighting，predict state-action。


Monte Carlo Methods
----------------------------------------------------------------------

Experience simulating via learned model.
我就一直產生出 full path of experience，或是有時候不是 full path
是 max depth search path。每個完整的 path 被稱為 `roll-out` 。
然後就拿著這些 roll-out，
用 optimality rule (e.g. discounted sum of reward) 走完，
更新完走過的 state 的 value 。

原本的 Monte Carlo Tree Search 是，先用 greed action 到達某個深度，
然後往後的 action 就是 random choice，random 到 terminal state。
這樣我們就不用考慮完整的 state space，像是 DP 就要考慮全部，這太多了。

那麼給定一個 :math:`(s, a)` pair，
要有多少的 sampling 才能精確估測 :math:`s'` ？

UCT 給出一種做法是，如果我的 state 越少被 visit 過，那麼提高 Q value，
讓 agent 去嘗試某個 action。

.. math::

    a = \arg \max_a Q(s, a) + 2 c \sqrt{\frac{\log(C(s, d))}{C(s, a', d)}}

where :math:`d` is depth in tree, :math:`c` is a scale factor.

:math:`c` 只是要讓後面的東西，scale 到 Q value 的合理範圍

Algorithm 10 是 UCT


Combining Models and Plaining
----------------------------------------------------------------------

整個完整的 Model-base algo 需要兩個部分，先 build model，然後 plaining，
plaining 完後回去 update model。

我的理解是，update model -> update value function -> update model ... etc.

`plaining` 就是 `inference`

所以 model 何時 update?
觀察到 transition 馬上 update：online；
走過 :math:`k` steps 再 update：batch，但是這樣在某些情境不適合，
因為 :math:`k` steps 後 update 代表，
某個 action 到某個 action 中間會經過較長的時間。

`DYNA` 的 plaining update 是從 experience （或 real world）隨機挑一些
state-action pairs 後 rollout，來 update。

-> `Prioritized Sweeping`

-> `DYNA-2`

對 real time 的應用有提出 async/threaded 的版本。


Sample Complexity
----------------------------------------------------------------------

`R-MAX`
    先 init 所有沒看過的 state 爲 absorbing state，
    而且這個 absorbing state 會產生 max reward，這樣會鼓勵 agent 用探索，
    然後提高 model 的品質。

    Knows What It Knows `KWIK`


Bandit based Monte-Carlo Planning
----------------------------------------------------------------------

Abstract

    對 large state-space 的 MDP, Monte-Carlo Planning 是其中一種可行的
    optimization 手法。

    New algorithm in this paper: UCT

Intro.

    想象這裡有一堆 state-action nodes，我們在 edge 上面標註 reward。
    從某個 state-action node （為 root）開始，然後往下走，
    這個 root node 的 value 怎麼算？往下走到 terminal state，
    後就把 path 上的 reward 傳回去。然後 root node 就對各個 sub-tree
    傳回來的 value 做 mean，然後就得出這個 node 的 value。

    本篇對 Monte-Carlo plaining 的兩個特性有興趣：

    #. Converge to optimal action if time enough

    #. Small error probability if the algorithm is stopped prematurely(?)

    Monte-Carlo 有用在 non-deterministic(stochastic，有運氣成分的那種)
    and imperfect info game。