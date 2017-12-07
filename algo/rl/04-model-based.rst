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
