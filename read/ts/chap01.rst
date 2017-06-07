Intro
===============================================================================

`Assets Returns`
    Scale-free feature.
    return series 比 price series 具有更多良好的統計特性。但是有各種
    return definitions.

`Simple Gross Return`

    Single period return.

    .. math::

        1 + R_t = \frac{P_t}{P_{t-1}}


`Multiperiod Simple Return`

    Hold :math:`k` period. A.k.a compound return.

    .. math::

        \begin{align*}
            1 + R_t[k] & = \frac{P_t}{P_{t-k}} \\
                    & = \frac{P_t}{P_{t-1}} \times \frac{P_{t-1}}{P_{t-2}}
                    \times \dots \times \frac{P_{t-k+1}}{P_{t-k}} \\
                    & = (1 + R_t)(1 + R_{t-1}) \dots (1 + R_{t-k+1}) \\
                    & = \prod_{i=0}^{k-1} (1 + R_{t-i})
        \end{align*}


    所以 Multiperiod 實際上就是 single period 的連乘。
