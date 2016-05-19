Genetic Algorithm
===============================================================================

String (chromosome) 的選用

Paper
    1996, PRL, Vol 17 P825-832

    "In Search of Optimal Clustering using GA"

把 n 點分成 k 群之結果用長度為 n 之 string 表示

e.g. 3000 points 分 3 群, 則
(x_1, x_2, ,,,           x_3000) =
(A,   A,   C, B, C, ..., C)

缺點
    i.找最佳分群結果(最佳字串)太花時間.

    \because solution space 是 3^3000

    ii.

    string1: ABB CBA
    string2: ACC BBA

    做 Cross over, 取 string1 前半 以及 string2 後半,
    得到 ABB BBA, 則 Cluster C 不見了, 群數變少,
    是無效的 cross over

2002 Info Science
    "An Evolutionary Technique based on k-means for Optimal Clustering"

    其 Optimal 是企圖降低 1 次方 error,
    而不是 TSSE 的 2 次方 error


