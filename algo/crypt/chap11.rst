Hash Functions
===============================================================================

Hash function :math:`H` 吃任意長度的 input data :math:`M` ，
然後輸出固定長度的 output。

.. math::

    h = H(M)

主要的目的是拿來做 data integrity 的檢查，checksum。


Cryptography Hash Functions
----------------------------------------------------------------------

這類的演算法，有這些特性：

- One-way property: 單向的效果，
  computational infeasible to find the data object, given a certain hash.
  給你一個 hash，找 hash 麻煩。

- Collision-free property: 對於兩個不同的 input data，找不到一個 pair 是算出
  相同的 hash value 的。

所以 hash functions 可以用在 data integrity，檢查資料有沒有被篡改。


Application of Cryptography Hash Functions
----------------------------------------------------------------------


Message Authentication
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Alice 要寄信給 Bob，在裡面的 data 加上了 Hash values
成為的 data'。
Bob 收到的時候只要把後面的 Hash values 拿起來看看，可以知道 data integrity，
有沒有傳壞掉。

但是這樣還是會遭到 man-in-the-middle-attack。

Darth 還是可以在中間加料後，append hash value 上去，讓 Bob 覺得東西好像沒
壞掉。

解法： Figure 11.3

#. 導入 data encryption 就好了。

#. 對 hash value 做簽章就好了。

#. 當資料很大時，我們就不會想要加密整個 data。
   在製作 hash value 的同時導入一個 shared 的 key 就好了。

#. double protection.


Message Authentication Code
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

A.k.a `keyed hash function`

兩邊要 shared 一個 secret key 來做 authentication

Practices: SSL/TLS

.. math::

    E(K, H(M))


- MAC 沒辦法區分是兩者中誰送出的，因為是 shared secret key。

- Chap 12


Digital Signature
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#. 假設 message 不 sensitive，就在 M 後面加上 digital signature
   就好了。證明是 Alice sign 的即可。


#. 如果 message 很重要，先 sign 一下 ，也可以整個兩個做對稱式加密。


Other Hash Functions Uses
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- Password saved in DataBases.
  (One-way password file)

- intrusion detection

- virus detection

- 實作 pseudorandom function (PRF) or a pseudorandom number generator (PRNG)


Two Simple Hash Functions
----------------------------------------------------------------------

input 長度不定，所以用 iteration。

這裡介紹簡單的，雖然 insecure。

#. 切 n 個 block，每個 block 直接 bit-by-bit XOR。

#. 每個 block + circular shift。
   第一個 block shift 1，第二個 shift 2 之類的。

上面這兩個 Hash functions 的弱點是，我們只要特製一下最後一個 block，
就能夠作出 collision。
因為這兩個 hash functions 就只是重複的做 XOR。