Functions
===============================================================================

.. highlight:: julia

built-in
----------------------------------------------------------------------

``typeof``::

    julia> typeof(:foo)
    Symbol

``in``::

    julia> a
    2×3 Array{Int64,2}:
    1  2  3
    4  5  6

    julia> 1 ∈ a
    true

    julia> 1 ∉ a
    false

``length`` and ``size``::

    julia> a
    2×3 Array{Int64,2}:
    1  2  3
    4  5  6

    julia> length(a)
    6

    julia> size(a)
    (2, 3)
