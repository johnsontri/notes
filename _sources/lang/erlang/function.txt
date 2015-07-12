***************
Erlang Function
***************

.. toctree::


.. highlight:: erlang


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
