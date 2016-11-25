Concurrent
===============================================================================

receive
----------------------------------------------------------------------

::

    receive
        Pattern1 -> value;
        Pattern2 -> value
    after Time ->
        value
    end.

.. note::
    ``Time`` is in millionseconds, but can be atom ``infinity``.
