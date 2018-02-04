# Policy evalution
# Given a single random policy, we do not change this policy

# the Gridworld is 4×4
V = zeros(4, 4)
R = -ones(4, 4)
V′ = copy(V)

function apply(A, i, j) # apply action
  ((i == j == 1) || (i == j == 4)) && return (0, 0, 0, 0)
  a = i > 1 ? i - 1 : i
  b = j > 1 ? j - 1 : j
  c = i == 4 ? 4 : i + 1
  d = j == 4 ? 4 : j + 1
  (A[a, j], A[i, b], A[c, j], A[i, d])
end

for k ∈ 1:250
  @show k
  for i ∈ 1:4
    for j ∈ 1:4
      V′[i, j] = 0.25*sum(apply(V, i, j)) + 0.25 * sum(apply(R, i, j))
    end
  end
  V = copy(V′)
  @show V
end
