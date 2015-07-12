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
^^^^^
    ``-Name(Attribute).``

Required attribute
^^^^^^^^^^^^^^^^^^
    ``-module(Name).``

    *Name* is an atom

Export functions
^^^^^^^^^^^^^^^^
    ``-export([Function1/Arity, Function2/Arity, ..., FunctionN/Arity]).``

    Arity
        How many arg can be passed to the function.

        Different function can share *same name*: ``add(X, Y)`` and ``add(X, Y, Z)``.
        They will carry diffrent arity: ``add/2`` and ``add/3``.

Import functions
^^^^^^^^^^^^^^^^
    ``-import(Module, [Function/Arity, ...]).``

    ::

        -import(io, [format/1]).

Macro
^^^^^
    similar to C's Macro. They will be replace before compiling.

    ``-define(MACRO, value).``

    Use as ``?MACRO`` inside code.

    e.g.::

        -define(sub(X, Y), X - Y).


Function
---------

Sytax
^^^^^
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


Compile the code
=================

* ``$ erlc file.erl``
* In shell, ``c(module)``
* In shell or module, ``compile:file(FileName)``

Define compiling flags in module
--------------------------------
    e.g.:
        ``-compile([debug_info, export_all, ...]).``

Compile into native code
------------------------
    There is two way to deal with it.

    * ``hipe:c(Module, OptionList).``
    * ``c(Module, native).``


More about module
==================


``module_info/0``
-----------------

::

    > test:module_info().
    [{module,test},
    {exports,[{add,2},{module_info,0},{module_info,1}]},
    {attributes,[{vsn,[146299772997766369192496377694713339991]}]},
    {compile,[{options,[native]},
            {version,"6.0"},
            {time,{2015,7,12,15,5,54}},
            {source,"/tmp/test.erl"}]},
    {native,true},
    {md5,<<179,5,110,53,195,122,250,63,30,245,110,140,79,
            121,143,254>>}]


``module_info/1``
-----------------

::

    > test:module_info(exports).
    [{add,2},{module_info,0},{module_info,1}]


vns
---

This is an auto generated version for your code.
It's used for hot-loading.

::

    > hd(test:module_info(attributes)).
    {vsn,[146299772997766369192496377694713339991]}


It can be set manually.

``-vsn(VersionNumber).``
