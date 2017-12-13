Key Managment and Distribution
===============================================================================

目前安全性的依賴 key 的保存。
How to keeping private key secure?


Key Distribution
----------------------------------------------------------------------

Symmetric key

    對稱式加密需要 shared key，那麼這個 key 怎麼傳過去給對方？
    大家都看得到你的封包。

    假設有 A B 兩方，你可以

    #. 實體上交給對方

    #. 找個第三方同時在實體上交給 A B

    #. 假設 A B 直接有已經用過的 old key，那麼 A 可以產生一個 new key 然後
       用 old key 加密後給 B。然後下次 A B 都用 new key。

    #. A B 都用加密連線連到 third party C， C 就用這個加密連線同時傳給 A B。


Pub/private key pair

    * How is the owner of private key?

    *
