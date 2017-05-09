# in julia 0.5
function f{T<:Real}(x::Point{T})
    # ...
end

# in julia 0.6
function f(x::Point{<:Real})
    # ...
end
