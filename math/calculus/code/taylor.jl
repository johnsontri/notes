using Reel
using Gadfly

a = 1

function ∇cos(order)
  order % 4 == 0 && return x -> cos(x)
  order % 4 == 1 && return x -> -sin(x)
  order % 4 == 2 && return x -> -cos(x)
  order % 4 == 3 && return x -> sin(x)
end

f(x)   = cos(x)
f′(x)  = ∇cos(1)(x)
f′′(x) = ∇cos(2)(x)

# let `g` be the approximator
g(order = 5) = x -> sum(i -> ∇cos(i)(a) * (x - a)^i / factorial(float(i)), 0:order)

# For Plots.jl
# plot([cos, g(0), g(1), g(2)], -π, 2π, ylims = [-3, 3])

# For Gadfly
Gadfly.push_theme(:dark)

function r(t, Δt)
  order = round(Int, t / Δt)
  plot(
    layer(x = [a], y = [cos(a)], Geom.point),
    layer([cos, g(order)], -π, 2π),
    Coord.cartesian(ymin = -3, ymax = 3, xmin = -π, xmax = 2π),
    Guide.title("$(lpad(order, 2, "0"))-order expansion"),
  )
end

film = roll(r, fps = 12, duration = 2)
write("/tmp/output.gif", film)
