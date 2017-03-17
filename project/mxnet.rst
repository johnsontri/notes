MXNet
===============================================================================

MXNet.jl
----------------------------------------------------------------------

- 如何拿到 network 中的 weight?
  在 Julia 的 wrapper 中，所有操作必須是 MXNet 的 NDArray，這是 MXNet 的 tensor
  資料結構。而且有可能在 GPU 中，必須透過 ``mx.copy!(Array, NDArray)``
  來取得::

    # w is NDArray
    arr = zeros(eltype(w), size(w))
    mx.copy!(arr, w)
