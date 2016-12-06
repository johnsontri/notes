Classification
===============================================================================

Discriminant Function
----------------------------------------------------------------------

Two Classes
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    y(x) = \vec{w}^T x + w_0

:math:`w_0` is `bias`, sometimes a negative :math:`w_0` is called `threshold`

Multiple Classes
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:problem: 如果現在要分 3 類，而此時我們選用兩個 `one-versus-the-rest`
    classifier 形成的 hyperplane 做切割，在 feature space 上是兩條
    decision boundary ，而這兩條 boundary 會切出 4 個
    decision region ，但是我們只有 3 類，會有一塊在 testing 時是未知的區域。
    (p183. Figure 4.2)

:sol: Single K-class discriminant function, 然後用 K 個組合起來。

.. math::

    y_k(\vec{x}) = \vec{w_k}^T \vec{x} + w_{k0}

e.g. 假設要分 3 類 :math:`C_1`, :math:`C_2`, :math:`C_3`

.. math::

    \begin{cases}
    y_1(\vec{x}) = \vec{w_1}^T \vec{x} + w_{10} \\
    y_2(\vec{x}) = \vec{w_2}^T \vec{x} + w_{20} \\
    y_3(\vec{x}) = \vec{w_3}^T \vec{x} + w_{30}
    \end{cases}


Let :math:`\vec{x} \in C_k \text{ if } y_k > y_j, \forall j \neq k`

Decision boundary 產生在 :math:`y_k = y_j` 時

.. math::

    \begin{cases}
    y_1 = y_2 \\
    y_2 = y_3 \\
    y_3 = y_1
    \end{cases}

    \implies \begin{cases}
    y_1 - y_2 = 0 \\
    y_2 - y_3 = 0 \\
    y_3 - y_1 = 0
    \end{cases}

.. math::

    \to
    (\vec{w_k} - \vec{w_j})^T \vec{x} + (\vec{w_{k0}} - \vec{w_{j0}}) = 0



Perceptron
----------------------------------------------------------------------

Perceptron criterion

    分對的 :math:`w^T \fin(x_n) t_n > 0`

    E 用 SGD 去調，每個 iter 都調一次

證明 converge: :math:`E(w^(t+1)) < E(w)`

(4.57) 用 同除分子
(4.57) 即 sigmoid function

(4.72) 取 log 而來


Section name
----------------------------------------------------------------------

maximum likelihood

4.2.1 why gaussian?

what is share variance?


Discriminative Model
----------------------------------------------------------------------

直接假設 model 是 linear
maximum posterior


4.87

logistic function 是來自 posterior

(4.89) 是 likelihood 沒差，但是展開的 :math:`y_n` 是來自 posterior

(4.91) cross-entropy (?) 我們想讓 entropy 越小越好
(4.91) AKA cross-entropy error function


sigmoid function 微分 :math:`\frac{d\sigma}{da = \sigma(1-\sigma)}`


IRLS
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

用 Newton-Raphon method
是 二次近似

(而 Gradient Descent 是一次近似)
