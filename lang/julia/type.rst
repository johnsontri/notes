Type
===============================================================================

.. highlight:: julia

Float
----------------------------------------------------------------------

- IEEE 754

- ``Inf``::

    julia> Inf > NaN
    false

- ``-Inf``

- ``NaN``::

    julia> NaN == NaN
    false

    julia> NaN != NaN
    true

    # Note
    julia> [1 NaN] == [1 NaN]
    false


functions
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- ``isequal(x, y)``::

    julia> isequal(1.0000000000000000000000001, 1.0000000000000001)
    true

    # Note
    julia> isequal(NaN, NaN)
    ture
    # diff from ``NaN == NaN``

    julia> isequal([1 NaN], [1 NaN])
    true

- ``isnan(x)``


Array
----------------------------------------------------------------------

::

    a = [1, 2, 3]

    a[1]    # 1
    a[end]  # 3

with type::

    a = Float64[1, 2, 3]
    a = Int[1, 2, 3]


Matrix
----------------------------------------------------------------------

::

    a = [1 2 3]

    a = [1 2 3; 4 5 6]

with type::

    a = Int[1 2 3]


Range
----------------------------------------------------------------------

::

	julia> [1:10]
	1-element Array{UnitRange{Int64},1}:
	1:10

	julia> [1:10;]
	10-element Array{Int64,1}:
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10

::

	julia> [1:3:20;]
	7-element Array{Int64,1}:
	1
	4
	7
	10
	13
	16
	19


Dict
----------------------------------------------------------------------

::

    Dict()

    d = Dict("foo" => 1, "bar" => 2)

    keys(d)

    values(d)

    ("foo" => 1) ∈ d

    haskey(d, "foo")


Pair
----------------------------------------------------------------------

::

    p = "foo" => 1
    p[1] == "foo"
    p[2] == 1


typeof
----------------------------------------------------------------------

Int64::

    julia> typeof(42)
    Int64

    julia> typeof(Int64)
    DataType

    julia> typeof(42)
    Int64

    julia> supertype(Int64)
    Signed

    julia> supertype(Signed)
    Integer

    julia> supertype(Integer)
    Real

    julia> supertype(Real)
    Number

    julia> supertype(Number)
    Any

    julia> supertype(Any)
    Any

String::

    julia> typeof("test")
    String

    julia> supertype(String)
    AbstractString

    julia> supertype(AbstractString)
    Any


Class
----------------------------------------------------------------------

::

    type Cat
        name::String
        age::Int
    end

    Cat("meow", Int)


- concrete type cannot have subtype::

    struct S
        ...
    end

