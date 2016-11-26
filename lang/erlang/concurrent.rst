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


Trap
----------------------------------------------------------------------

Turn a process into `system process`::

    process_flag(trap_exit, true).

And get exception via ``receive`` expression, e.g.::

    spawn_link(fun() -> timer:sleep(1000), exit(magic) end), receive X -> X end.

    %% will get {'EXIT',<0.134.0>,magic}.

The ``kill`` signal cannot be trapped::

    exit(self(), kill)
