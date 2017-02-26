Meta Programming
===============================================================================

.. highlight:: julia


Generated Functions
----------------------------------------------------------------------

- special macro ``@generated``

- return a quoted expression

- 根據 caller 提供的 type 資訊做 code generation.

e.g.::

    @generated function foo(x)
        # x denote type here
        # will show Int, Float64, String, ... etc
        println(x)
        return :(x * x)
