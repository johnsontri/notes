using Plots

plotlyjs()

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


function plot_σ_mse()
    σ(θ, x) = 1 / (1 + e ^ - (θ * x))

    # assume we have training data (5, 1), (1, 0), (10, 1)
    plot(θ -> (σ(θ, 5) - 1)^2 + (σ(θ, 1) - 0)^2 + (σ(θ, 10) - 1)^2,
         -10, 10,
         label="J(θ)", xlabel="θ")
    savefig(joinpath(img_dir, "logistic-mse.png"))
end


function plot_logistic_cost()
    σ(θ, x) = 1 / (1 + e ^ - (θ * x))

    # assume we have training data (5, 1), (1, 0), (10, 1)
    plot(x -> σ(5, x), x -> -log(σ(5, x)), -2, 2,
         ylabel="-log(h_θ(x))", xlabel="h_θ(x)")
    # the first argument reveals the Domain of x-axis:
    # the Range of σ, (0, 1), become the Domain of x-axis
    # and the second argument is the Range
    savefig(joinpath(img_dir, "logistic-cost-1.png"))

    plot(x -> σ(1, x), x -> -log(1- σ(1, x)), -10, 10,
         ylabel="-log(1 - h_θ(x))", xlabel="h_θ(x)")
    savefig(joinpath(img_dir, "logistic-cost-2.png"))
end


function main()
    uni_linreg_cost()

    plot_σ()

    plot_σ_mse()
end
