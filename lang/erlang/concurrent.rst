Concurrent
===============================================================================

.. highlight:: erlang

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


Link
----------------------------------------------------------------------

Here is a race condiction::

    link(spawn(...)).

It's possible that the process crash before the link established.
So, please use::

    spawn_link(...).
