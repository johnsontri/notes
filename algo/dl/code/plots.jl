using Plots

img_dir = joinpath(dirname(@__FILE__), "..", "img")


function uni_linreg_cost()
    J(θ) = 10θ^2 - 4θ + 5

    plot(J, -5, 5, label="J(θ)", xlabel="θ", ylabel="J(θ)")
    savefig(joinpath(img_dir, "uni_linreg_cost.png"))

    J
end

if !isinteractive()
    uni_linreg_cost()
end
