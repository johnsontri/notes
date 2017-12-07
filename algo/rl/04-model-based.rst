Learning and Using Model
===============================================================================

與 model-free (direct) RL 相對應。
Model-based (indirect) method 是去學習環境 model :math:`T(s, a, s')` 跟 :math:`R(s, a, s')`
in online manner.

Model 學完了之後，我就得到 optimal solution 了，就不用跟環境互動了。

Model-based 在處理 exploration 上面會有比較好的效率。
