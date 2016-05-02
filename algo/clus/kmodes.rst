K-Modes
===============================================================================

分 Category Data (Non-numerical 非數值)

1998, K-Modes

Mode 約等於 群中心，但不是平均而得，而是發生頻率最多次。

e.g. n = 5 , 點 {\vec{x_1} ... \vec{x_5}} 分 k = 2 群
given x_1 = (\alpha, big) = x_4
      x_3 = x_5 (\beta, mid)
      x_2 = (\beta, small)

Init
    猜 z_A = x_1 = (\alpha, big)
       z_B = x_2 = (\beta, small)

Iteration 1
    i. 分配 x_3 to B cluster (\because z_A 有兩個不同， z_B 只有一個不同)
       x_4 to A; x_5 to B
    ii. update centroid
        z_A = Mode { x_1 = (\alpha, big) = x_4 } = (\alpha, big)
        z_B = Mode { (\beta, small), (\beta, mid), (\meta, mid)} = (\beta, mid)

Iteration 2
    i. 改分配後
        A = {x_1, x_4},
        B = {x_2, x_3, x_5}
    ii. update centroid
        z_A = (\alpha, big)
        z_B = (\beta, small)
        Stop!


ps. 用發生率取代幾何平均

問題
    若
    A = {
        x_1 = (1, 1, 天)
        x_2 = (1, 1, 地)
        x_3 = (1, 1, 玄)
    }
    B = {
        x_4 = (1, 1, 黃)
        x_5 = (2, 1, 玄)
        x_6 = (1, 2, 天)
    }

    Mode z_A (1, 1, 天), Mode z_B = (1, 1, 黃)

    則 x_7 = (1, 1, 宇) 應分到哪裡？

2007, IEEE-T-PAMI
"On the impact of Dissimilarity Measure"

e.g. 統計圖 for A

| \dots | dim 1 | dim 2 | dim 3   |
| 1     | 3 次  | 3     | 1 次 天 |
|       |       |       | 1 次 地 |
|       |       |       | 1 次 玄 |
|       |       |       | 0 次 黃 |
|       |       |       | 0 次 宇 |
+-------+-------+-------+---------+
| 2     | 0     | 0     |         |

for B

| 1     | 2 次  | 2     |
| 2     | 1     | 1     |

diff measurement for (x_7, z_A) = (1 - (3 次) / 3) + (1- 3/3) + 1 = 1 維不同

(x_7, z_A) = (1- 2/3) + (1 - 2/3) + 1 = 1.6666 維不同
