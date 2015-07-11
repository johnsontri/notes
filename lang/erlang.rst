************
Erlang notes
************


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
