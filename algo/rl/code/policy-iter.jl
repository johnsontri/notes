const Point = NTuple{2, Int}

@enum Action ⬆ ⬇ ➡ ⬅ ✖

m = Bool[  # map
    false true  false true  true  true true  false true  true;
    true  true  true  true  true  true true  true  false true;
    true  false false true  true  true false true  true  false;
    true  true  true  true  false true true  true  true  true;
    false true  true  true  false true true  false true  true;
    true  true  true  false true  true false true  false false;
    true  true  true  true  false true true  true  true  true;
    true  true  true  true  true  true true  true  false true;
    true  true  true  true  true  true true  true  true  false;
    true  true  true  false true  true true  true  true  true]

fin = (5, 10)  # point
R = zeros(10, 10)
R[5, 10] = 100

A = similar(m, Action)
A[:] = ➡
A[m .== false] = ✖

# for i ∈ 1:10, j ∈ 1:10
#     if j + 1 > 10 || m[i, j + 1] == false  # go down
#         A[i, j] = ⬇
#     end
# end
#
# for i ∈ 1:10, j ∈ 1:10
#     if A[i, j] != ⬇
#         continue
#     end
#
#     if i + 1 > 10 || m[i + 1, j] == false  # go left
#         A[i, j] = ⬅
#     end
# end

function V(p::Point)
    if R[p...] != 0
        R[p...]
    else
        p = collect(p)'

        joint_p = [p .+ [1 0]; p .+ [0 1]; p .- [0 1]; p .- [1 0]]
        joint_p = joint_p[
            reshape(sum((joint_p .!= 0) .& (joint_p .!= 11), 2) .== 2, 4), :]

        v::Float64 = 0
        for i in 1:size(joint_p, 1)
            x, y = joint_p[i, :]
            v += V((x, y)) / 4
        end

        v
    end
end
