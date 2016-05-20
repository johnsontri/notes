Builtin Functions
===============================================================================

.. toctree::

.. highlight:: python


``print``
----------------------------------------------------------------------

::

    >>> print('\v'.join(map(str,range(10))))
    0
     1
      2
       3
        4
         5
          6
           7
            8
             9

    >>> print('\v'.join(map(str, range(10, 20))))
    10
      11
        12
          13
            14
              15
                16
                  17
                    18
                      19

Exception
----------------------------------------------------------------------

Handy ``args``

::

    >>> e = Exception('reason', 'detail')
    >>> e.args
    ('reason', 'detail')
