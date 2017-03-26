Part I
===============================================================================

Math basic

Linear Model
----------------------------------------------------------------------

* 經典的 XOR 問題，無法用 linear model 解。需要做高維度的 feature extraction
  或是 NN 的轉換 座標空間 來解。



ReLU
----------------------------------------------------------------------

.. code-block:: julia

    relu(x) = (x > 0) ? x : 0


https://en.wikipedia.org/wiki/Rectifier_(neural_networks)

- low computational cost. 但我認為這不是決定性的因素

- 對於 deep 的 MLP 在做 back propagation 的時候， sigmoid function or ``tanh``
  容易造成在經過多次微分後，在前面的的 layer 的變動量很小，收斂效果差。
  sigmoid 跟 ``tanh`` 的 upper / lower bound 在 deep MLP 底下反而是收斂的阻礙。

- ReLU 在 x 輸出是 0 的部分，造成了某種 topology 的選擇，
  如果採用 fully connected NN ， outcome 為 0 的部分可以想象成把 connection
  拔掉。
