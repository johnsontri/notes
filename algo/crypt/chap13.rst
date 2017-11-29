Digital Signature
===============================================================================

Bob 的 message 會先過 hash function 然後 用 private key sign 這個 hash value，
然後 append 在 message 後面


Property
----------------------------------------------------------------------

#. 要能夠一起驗證 date and time

#. 其他人也要能驗證你簽出來的東西

#. 不可否認性質


Attacks
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

A is the signer
C is somebody on internet, the attacker.

#. Key-only attack: C 有 A 的 public key。C 的資訊量沒比較多，沒啥攻擊的好方法。

#. Known message attack: C 有 message + signature pairs。也是沒比較多。

#. Generic chosen message attack: C 選了一系列的 messages，然後拿到 這些特定的
   signatures

#. Directed chosen message attack: C 看著 A 的 public，然後才開始選
   系列 message。

#. Adaptive chosen message attack: C 想要 有 message-signature pair
   就隨時可以拿到


Forgery
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#. Total break: C 拿到了 private key

#. Universal forgery: C 找到了不同的演算法，可以產出一樣的 signature，
   對任意的 input。

#. Selective forgery: only chosen text 有 signature。

#. Existential forgery: 就只是找到，但 message 內容可能是無意義的。


Digital Signature Requirements
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


