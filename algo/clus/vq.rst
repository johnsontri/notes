Vector Quantization
===============================================================================

If we want to transfer 10000 vector data
:math:`\{\vec{x_1}, \vec{x_2}, \dots, \vec{x_{10000}}\}`
:math:`\forall \vec{x}` is high-dimension(e.g. 16-dim).

Problem
----------------------------------------------------------------------

How to speed up the data transfer? If we can accept error.


Solution
----------------------------------------------------------------------

We can use VQ for data compression.

First, we can cluster vectors into 8 clusters.
Then we get 8 centroid.

Thus, we only need to transfer
:math:`\{ \vec{centroid_0}, \dots,\vec{centroid_7} \}`
and 10,000 numbers which represent the cluster belongs to.

And, :math:`\forall` 10000 numbers, it only 3 bits to transfer (000 - 111).

Results
    This method will get high transfer speed, but the error is quite larger.

.. note::
    The 8 clusters so-called *codebook*.
    Each centroid is a *codeword* (*codevector*).



Codebook Generation
----------------------------------------------------------------------


The commonly used Linde-Buzo-Gray (LBG) algorithm to create codebook
*is in face k-means*.


Conclusion
----------------------------------------------------------------------

- If centroid come from known public data, then your vector data called
  *Outside Data*.(Data may irrelavent to centroid)

- If codebook is generated from data, we call them *inside data*.
  Then, the error will lower, but the transfer cost raise.


e.g.: Assume we use our own codebook
- Data --(clustering) --> 8 clusters

- Data --(classification) --> near to which cluster

