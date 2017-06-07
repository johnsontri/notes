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

    上面的公式完全等同於 `相對前一個 period 的漲跌幅`


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

`Annualized Returns`

    If we hold :math:`k` years.

    .. math::

        Annualized\{R_t[k]\} = (R_t[k])^{\frac{1}{k}} - 1

    上式可以理解成 :math:`R_t[k]` 開根號是去做 geometric mean, 因為
    multiperiod 可以寫成每個 period 連乘。
