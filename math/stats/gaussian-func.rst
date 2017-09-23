Gaussian Function
===============================================================================

在圖上看起來就是個對稱的 `bell curve`

Def
----------------------------------------------------------------------

Generic form:

.. math::

    f(x) = \alpha e^{- \frac{(x - \beta)^2}{2 \gamma^2}}

Where :math:`\alpha,\ \beta,\ \gamma \in \mathbb{R}`

- :math:`\alpha` 控制整個 curve 的 peak

- :math:`\beta` 控制 peak 的發生點

- :math:`\gamma` (standard diviation) 控制整個 bell 的寬度


Examples
----------------------------------------------------------------------

.. code-block:: julia

    function f(a, b, c)
        x -> a * e^(-((x - b)^2) / (2c^2))
    end

    using UnicodePlots

    lineplot(f(2, 0, 3), -10, 10)


Reference
----------------------------------------------------------------------

- https://en.wikipedia.org/wiki/Gaussian_function
