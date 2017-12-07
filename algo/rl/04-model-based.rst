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


