function f(x, unit = 50)
  n = floor(log(2, x / unit + 1))
  cost = unit * (2^n -1)
  next_cost = unit * (2^(n+1) - 1)
  win = (2^n - 1) * unit / 2^n
  loss = cost / 2^n
  @show cost
  @show next_cost
  @show n
  @show win
  @show loss
  @show 1/2^n * 100
  # expectation
  win - loss
end
