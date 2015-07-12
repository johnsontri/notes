************
Erlang
************

.. toctree::


Shell
=====

quit
    ``^G`` then ``q``


Variable
========

+ Capitalize

::

 > One = 1.
 1


Anonymou var
    ``_``


Atom
====

::

 > red.
 red

 > red = 'red'.
 red

 > red == 'red'.
 true


Bool
====

+ ``and``
+ ``or``
+ ``andalso``: short-circuit operators
+ ``orelse``: short-circuit operators
+ ``=:=``
+ ``=/=``
+ ``==``
+ ``/=``
+ ``>``
+ ``<``


order
     number < atom < reference < fun < port < pid < tuple < list < bit string


Tuples
======

::

 > Point = {3, 4}.
 {3,4}

 > {X, Y} = Point.
 {3,4}

 > {X, _} = Point.


tagged tuple
    ``{km, 100}``


List
====

syntax
    ``[e1, e2 ...]``

string is a list (no built-in string type)::

 > [97, 98, 99].
 "abc"

 > [97, 98, 99, 4, 5, 6].
 [97,98,99,4,5,6]

 >[233].
 "é"


Note
    Erlang is lack of string manipulations functions.


operators
---------

``++``
    right-associative, eval from right to left.
``--``
    right-associative.

::

 > [1,2,3] -- [1,2] -- [3].
 [3]

 > [1,2,3] -- [1,2] -- [2].
 [2,3]


functions
---------

hd (head)
    pick up the first element::

    > hd([1, 2, 3]).
    1

tl (tail)
    pick up [1:]::

    > tl([1, 2, 3]).
    [2, 3].

    > tl([1, 97, 98]).
    "ab"
