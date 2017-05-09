# in julia both 0.5 and 0.6
function f{T<:Real}(x::Point{T})
    # ...
end

# in julia 0.6
function f(x::Point{<:Real})
    # ...
end

function f(x::Point{T}) where {T<:Real}
    # ...
end
