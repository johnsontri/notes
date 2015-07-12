*************
Erlang Module
*************

.. toctree::


.. highlight:: erlang


call a function from module
    ``Module:Function(Args).``

    ::

        > lists:seq(1, 10).
        [1,2,3,4,5,6,7,8,9,10]


Declaration
===========


Attribute
---------

Sytax
    ``-Name(Attribute).``

Required attribute
    ``-module(Name).``

    *Name* is an atom

Export functions
    ``-export([Function1/Arity, Function2/Arity, ..., FunctionN/Arity]).``

    Arity
        How many arg can be passed to the function.

        Different function can share *same name*: ``add(X, Y)`` and ``add(X, Y, Z)``.
        They will carry diffrent arity: ``add/2`` and ``add/3``.

Import functions
    ``-import(Module, [Function/Arity, ...]).``

    ::

        -import(io, [format/1]).

Macro
    similar to C's Macro. They will be replace before compiling.

    ``-define(MACRO, value).``

    Use as ``?MACRO`` inside code.

    e.g.::

        -define(sub(X, Y), X - Y).


Function
---------

Sytax
    ``Name(Args) -> Body.``

    Name
        an atom

    Body
        one or more erlang expressions

    Return
        The value of last expression

    e.g::

        add(X, Y) ->
            X + Y.

        hello() ->
            io:format("Hello World!~n").
