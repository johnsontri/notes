Least-Squares Methods for Policy Iteration
===============================================================================

`Approximate RL` 用了 function approximator 是為了解 large state space 跟
continuous state-action space。
本章的方法是 Approximate RL 的其中一個分支：
`least-squares methods for policy iteration`

- Least-Squares TD

- Least-Squares policy evaluation

- Bellman residual minimization

Central idea: `approximate policy iteration`


Classic Policy Iteration
----------------------------------------------------------------------

基本上的演算法就是兩個步驟

Let :math:`k` is iteration number.

.. math::

    & \text{find}\ Q^{\pi_0}(s, a) \\
    & \pi_1 \leftarrow \arg \max_{a \in A} Q^{\pi_0}(s, a),\ \forall s \in S \\
    & \text{find}\ Q^{\pi_1}(s, a) \\
    & \pi_2 \leftarrow \arg \max_{a \in A} Q^{\pi_1}(s, a),\ \forall s \in S \\
    & \dots

直到 converge。
這裡的找 Q 的動作就是 `policy evaluation` ；
找 :math:`\pi_{k+1}` 就是 `policy improvement`

