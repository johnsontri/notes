Hierarchical Methods
===============================================================================

- Divisive 分裂式
- Agglomerative 聚合式


Divisive
----------------------------------------------------------------------

At first, there is only one group.

We will pick up a group and divide it in following step.

e.g.

.. math::

    \{1, 3, 5, 6, \^ ,78, 79, 96, 97, 98\}

    \text{step1}

    \{1, 3, \^ , 5, 6\} \{78, 79, \^ , 97, 98\}

    \text{step2 ... etc}


Agglomerative
----------------------------------------------------------------------

At first, each point form a group.
:math:`\therefore` *n* point => *n* groups.

Then, we will merge the most similar two groups in following step.
:math:`\therefore \text{groups} - 1`


Distance between Two Clusters
----------------------------------------------------------------------

Assume we have two clusters -- :math:`\text{cluster}_A \text{cluster}_B`.


Definition 1: Centroid
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    D(A, B) = | \overline{a} - \overline{b} |

    \text{where }
    \overline{a} = \frac{\sum x}{ | a | }, x \in A

    \overline{b} = \frac{\sum x}{ | b | }, x \in B


Definition 2: Min Distance
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    D_{min}(A, B) = min( | a - b | )

    \text{where }
    a \in A,
    b \in B

    Complexity: \Omega(n^2)


Definition 3: Max Distance
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    D_{max}(A, B) = max( | a - b | )

    \text{where }
    a \in A,
    b \in B

    Complexity: \Omega(n^2)


Definition 4: Average Distance
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    D_{average}(A, B) = \frac{\sum | a - b | }{ | A | \times | B | }


Definition 5: Ward's Distance
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. math::

    D_{Ward}(A, B) =
    \sqrt{\frac{2 | A | | B | }{ | A | + | B | }} \times
    | \overline{a} - \overline{b} |

When we merge two groups into one, the *TSSE* will rise.
Ward suggests that picking up the merging of mini *TSSE* rise.

Wishart turned Ward's theorem into formula.


Distance Matrix
----------------------------------------------------------------------

距離矩陣

Assume there is a n-by-n matrix :math:`A_{n \times n}`.

.. math::



    \begin{matrix}
        ~      & x_1    & x_2    & \dots  & x_n    \\
        x_1    & 0      & d_{12} & \dots  & d_{1n} \\
        x_2    & d_{21} & 0      & \dots  & d_{2n} \\
        \vdots & \vdots & \vdots & \ddots & \vdots \\
        x_n    & d_{n1} & d_{n2} & \dots  & 0      \\
    \end{matrix}


It's symmetrical.

:math:`\because d_{12} = d_{21} = | \vec{x_2} - \vec{x_1} |`

:math:`\therefore \Omega(n^2)` 計算跟儲存量
