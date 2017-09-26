data = readcsv(joinpath(@__DIR__, "dataset.csv"))

class1 = data[data[:, 3] .== 1, :]
class2 = data[data[:, 3] .== 2, :]

center1 = class1[rand(1:size(class1, 1), 10), :]
center2 = class2[rand(1:size(class2, 1), 10), :]

for i in 1:20
    info(i)
    err_sum = 0

    new_center1 = zeros(size(center1))
    new_center2 = zeros(size(center2))

    mapslices(class1, 2) do x
        err, c = findmin(sum((center1 .- x').^2, 2))
        new_center1[c, :] .+= [x[1:2]; 1]

        err_sum += err
    end

    info("MSE: ", err_sum / size(center1, 1))
    center1[:, 1:2] = new_center1[:, 1:2] ./ new_center1[:, 3]
end

idx = map(_ -> Int[], 1:size(center1, 1))
for i ∈ 1:size(class1, 1)
    x = class1[i, :]'
    _, c = findmin(sum((center1 .- x).^2, 2))
    push!(idx[c], i)
end

# σ
σ = Float64[]
for i ∈ idx
    σ = [σ; std(view(class1, i, 1:2), 1)]
end
μ = @view center1[:, 1:2]

o = Float64[]
for i ∈ 1:size(class1, 1)
    x = class1[i, 1:2]'
    ϕ = exp.(-sum((x .- μ).^2, 2) ./ (2 .* sum(σ.^2, 2)))
    o = [o; ϕ']
end
