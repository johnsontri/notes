.. _gaussian-func:

Gaussian Function
===============================================================================

在圖上看起來就是個對稱的 `bell curve`

Def
----------------------------------------------------------------------

Generic univariable form:

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


Probility Density Function
----------------------------------------------------------------------

.. math::

    g(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{(x - \mu)^2}{2\sigma^2}}


因為，根據機率公理

.. math::

    \int f(x) & = 1 \\
    \int_{-\infty}^{\infty} \alpha e^{-\frac{(x - \beta)^2}{2\gamma^2}} dx & = 1


D-dimensional form:

.. math::

    g(x) = \frac{1}{(2\pi)^{\frac{D}{2}} | \Sigma | ^{\frac{1}{2}} }
        e^{- \frac{ (\vec{x} - \vec{\mu})^T \Sigma^{-1} (\vec{x} - \vec{\mu})}{2}}

where :math:`\Sigma` is the covariance matrix


Reference
----------------------------------------------------------------------

- https://en.wikipedia.org/wiki/Gaussian_function
