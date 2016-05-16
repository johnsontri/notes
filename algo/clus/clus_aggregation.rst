Clustering Aggregation by Probability Accumenulation
===============================================================================


Wang, Yang, Zhou
P.R. 2009 Vol 42 page. 668-675

:math:`{\vec{x_1} \dots \vec{x_n}}` for each is m-dimension

~
c^(1) ... c^(9) 是 9 種分群結果

Step 1:
    算 Component Matrix [A]^(P), P = 1 ... 9

    A^(P)_{ii} = 1, \forall i = 1 ... n

                  /- 0, if x_i 與 x_j 不同群 in C(P)
    A^(P)_{ij} = {
                  \-    \frac{1}{1 + (含 x_i, x_j 那群之元素個數)^(1/m)}

Step 2
    \bar{A} = P association
            = \frac{1}{9} \sum^9_{P=1} [A]^(P)

Step 3
    Then, transform \bar{A} into distance matrix

    d(x_i, x_j) = 1 - \bar{A}(x_i, x_j)
                = 1 - \bar{A_{ij}}
