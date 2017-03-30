Regularization
===============================================================================

* :math:`L^0, L^1, L^2` regularization:
  透過 penalty term 對 loss function 下手

* Data Augmented: 對 data 加入 noise 達到 model 的 robustness

* Share Weight

* Bigging, boosting


Data Augmented
----------------------------------------------------------------------

* Image deformation: 加入了旋轉、抖動等 noise
    * :ref:`deep-nn-mnist`


Share Weight
----------------------------------------------------------------------

降低 parameter (or weight in NN context) 來避免 overfitter。
如： CNN
