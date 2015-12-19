***************
Erlang Function
***************

.. toctree::


.. highlight:: erlang


Basic
======================================================================

::

    1> Fun = fun(X) ->
                 math:sqrt(X) * 10
             end.


Pattern Matching
================

Function Clause
-------------------

Sample: replace if

.. code-block:: python

    def g(gender, name):
        if gender == 'male':
            print('Hello, Mr. {}'.format(name))
        elif:
            print('Hello, Mrs. {}'.format(name))
        else:
            print('Hello, {}'.format(name))


In Erlang::

    g(male, Name) ->
        io:format("Hello, Mr. ~s", [Name]);
    g(female, Name) ->
        io:format("Hello, Mrs. ~s", [Name]);
    g(_, Name) ->
        io.format("Hello, ~s", [Name]).


Guards
=======

Addictional clause to check vars.

::

    is_pass(X)
        when X >= 60, X =< 100 ->
            true.
    is_pass(_) ->
        false.

    > module:is_pass(80).
    true

    > module:is_pass(a).
    true
    %% what happend ?!
