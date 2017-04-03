using Plots

img_dir = joinpath(dirname(@__FILE__), "..", "img")


function uni_linreg_cost()
    J(θ) = 10θ^2 - 4θ + 5

    plot(J, -5, 5, label="J(θ)", xlabel="θ", ylabel="J(θ)")
    savefig(joinpath(img_dir, "uni_linreg_cost.png"))

    J
end


"""
Sigmoid function
"""
σ(x) = 1 / (1 + e^(-x))

function plot_σ()
    plot(σ, -20, 20, label="σ(z)")
    savefig(joinpath(img_dir, "sigmoid.png"))
end


if !isinteractive()
    uni_linreg_cost()

    plot_σ()
end
