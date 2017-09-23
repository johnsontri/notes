"""
    pcor(x, y, y)

Partial correlation via least square method

E.g:
```julia
julia> df
4×3 DataFrames.DataFrame
│ Row │ x  │ y │ z │
├─────┼────┼───┼───┤
│ 1   │ 2  │ 1 │ 0 │
│ 2   │ 6  │ 3 │ 0 │
│ 3   │ 10 │ 2 │ 1 │
│ 4   │ 20 │ 4 │ 1 │

julia> pcor([2, 6, 10, 20], [1, 3, 2, 4], [0, 0, 1, 1])
0.904194430179465
```
"""
function pcor(x::Vector, y::Vector, z::Vector)
    n = length(x)

    # Normal Equation Method
    #= w_x = pinv(z' * z) * z' * x =#
    #= w_y = pinv(z' * z) * z' * y =#
    w_x = first(z \ x)
    w_y = first(z \ y)

    e_x = x .- w_x * z
    e_y = y .- w_y * z

    (n * sum(e_x .* e_y) - sum(e_x) * sum(e_y)) / (
        (sqrt(n * sum(e_x.^2) - sum(e_x)^2)) * (sqrt(n * sum(e_y.^2) - sum(e_y)^2)))
end
