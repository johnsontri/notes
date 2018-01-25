Reinforcement Learning of Continuous State and Action Spaces
===============================================================================

本章主要介紹
    - 直接 update value function `representation` 的方法

    - 直接 update policy function `representation` 的方法

對於 function representation 的選擇有各種考量，然後選好 representation 後
還有 update (optimization) 的方法 -- gradient-based and gradient-free method。

    - gradient-based TD learning

    - evolutionary

    - policy-gradient

    - actor-critic


Intro.
----------------------------------------------------------------------

Problem setting: sequential decision making in
    - continuous domain
    - delayed reward


MDP in Continuous Spaces
----------------------------------------------------------------------

假設我們的 state space :math:`S` 是 infinitely large

Transition probability 的 PDF，就是對 :math:`s'` 積分

.. math::

    \int T(s, a, s') d s' = P(s' | s, a)

也有另一種 form：

.. math::

    s' = T(s, a) + \omega_T(s, a)

這裡的 :math:`T` 訂成一個 deterministic function
:math:`T: S \times A \rightarrow S`,
:math:`\omega_T` 是個 zero-mean 的 noise vector。
上面這種新式的物理意義是，
我可以從「以 :math:`T(s, a)` 為中心的 Gaussian」 sample 出 :math:`s'`
然後我的 reward function 也可以加上 noise：

.. math::

    r' = R(s, a, s') + \omega_R(s, a, s')

上面 :math:`T` 跟 :math:`R` 帶著 :math:`\omega_T` 、 :math:`\omega_R` 的形式，
是 general form；如果 :math:`\omega` 在所有的 timestamps 中都是 0。
那麼整個 MDP 就是 deterministic，反之為 stochastic。

如果 :math:`T` 跟 :math:`R` 有 time-dependent，要導入 t 做考慮，
那麼這個 MDP 是 non-stationary。

Case I: action space 是離散的
    只有 state space 是 continuous。
    Policy :math:`\pi: S \times A \rightarrow [0, 1]` 長這樣：

    .. math::

        \pi(s, a) & = P(a | s) \\
        \sum_{a \in A} \pi(s, a) & = 1

Case II: action space 是 continuous
    用 :math:`\pi(s)` 的 PDF，從 :math:`\pi(s, a)` 對 action 積分，
    積出來的 function 就是在 action space 上的 PDF。

Value function 的目的是 predict `future discounted reward` 。
而 optimality 就是 最大化 reward。

:math:`B^\pi` 是 Dynamic Programming Operator，
given :math:`\pi` 後 :math:`B^\pi: \mathscr{V} -> \mathscr{V}`
where :math:`\mathscr{V}` is the space of value function。
這個 operator 吃一個舊的 value function 會吐出新的 value function。

.. math::

    (B^{\pi_i} V)(s) & = \int_A \pi(s, a)
        \Big( \int_S T(s, a, s') (R(s, a, s') + \gamma V(s')) ds' \Big) da \\
    \therefore \lim_{i \to \infty} (B^{\pi_i}V)(s) & = \\
    (B^* V)(s) & = \max_a \int_S T(s, a, s') (R(s, a, s') + \gamma V(s')) ds'


用 Q function 的話

.. math::

    Q^*(s, a) = \int_S T(s, a, s') (R(s, a, s') + \gamma \max_{a'} Q^*(s', a')) ds'


Methodologies to Solve a Continuous MDP
----------------------------------------------------------------------

Model Approximation

    去 approximate MDP model，然後拿估測出來的 approximation 算 :math:`\pi`.
    主要是估測 :math:`T`, :math:`R`, 因為 :math:`S, A, \gamma` 姑且都知道，
    或觀測得到。
    因為 Markov property 的假設，這些 function 只 depend on local data，
    算是在 sequence 上作出 iid 的效果。
    然後 model 的估測就變成 supervise learning problem。

    最經典的兩個方法 *value iteration* 跟 *policy interation*
    是拿 approximate model 算 value function。
    Model-based algorithm 對 continuous state MDP 的問題是 generalization，
    各種 state 的可能性，state space 可以無限大，
    難以在 build model 的時候全面的涵蓋。因此 model 的精確程度是備受質疑的。

    只有在 :math:`T(s, a, s')` 的 :math:`s'` 是個夠小的集合的時候，
    model approximation 才是可行的，在往後因 space 的因素，本章不會再討論
    更多 model approximation。

Value Approximation

    這類的方法是直接 approximate :math:`V^*, Q^*`

Policy Approximation

    這裡的 algorithm 直接 使用/update policy function。上面的 Value approximate
    是先有 value function 然後在需要的時候生出 policy，
    但這裡的 policy approximation沒有。

    `direct policy-search` and `actor only` algorithms。


Function Approximation
----------------------------------------------------------------------

在 value-based RL 中，target data 不想是原本的 supervise learning 確定是答案，
而 RL 的 target value 可能來自於觀測到的 state 等，所以不是所有的
supervise learning 都適用。所以 approximation 的選擇是有條件的。


Linear Function Approximation
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Feature extraction function :math:`\phi: S \rightarrow \Phi`
會把 state space map 到 feature space :math:`\Phi`

.. math::

    V_t(s) = \theta^T_t \phi(s)

在給定的假設下，有文獻證明 linear approximation 在 RL 的收斂性。

Tile Coding
**************************************************

基本上就是把 state space 切 coding，像是 one-hot coding，
在某個範圍就 activate 某個 feature。

Issue 是訊息的失真程度。如果
:math:`\phi(s) \rightarrow \phi(s')` 不能 implies :math:`s \rightarrow s'` 。
在這種狀況下，可以考慮使用 POMDP。


Learning rate issue
**************************************************

Learning rate 的挑選基本上可能會跟 state coding 有關。
先假設常見的參數更新形式。

.. math::

    \theta_{t+1} \leftarrow \theta_t + \alpha_t(s_t) \delta_t \phi(s_t)

這裡的 :math:`\alpha_t(s_t)` 就是 learning rate，或是文獻中會看到寫成
`step size`。 :math:`\delta_t` 則是 error，可以是 TD error 或是 gradient。

那麼當這個更新後的 :math:`\theta_{t+1}` apply 到 :math:`V_{t+1}` 時：

.. math::

    V_{t+1}(s) & = {\theta_{t+1}}^\mathsf{T} \phi(s) \\
        & = \Big( \theta_t + \alpha_t(s) \delta_t \phi(s) \Big)^\mathsf{T} \phi(s) \\
        & = {\theta_t}^\mathsf{T} \phi(s) + \alpha_t(s) \phi(s)^\mathsf{T} \phi(s) \delta_t \\
        & = V_t(s) + \alpha_t(s) \phi(s)^\mathsf{T} \phi(s) \delta_t

所以實際上所造成的更新量是

.. math::

    \alpha_t(s) \phi(s)^\mathsf{T} \phi(s) = \alpha_t(s) \| \phi(s) \|

即 :math:`\alpha` 乘上 coding 的 norm。
所以在選擇 :math:`\alpha` 的時候，要同時考慮 coding 的 norm。

舉例來說，如果 :math:`\| \phi(s) \| = M` ，
那麼就會選 :math:`\alpha < \frac{1}{M}` ，避免 learning rate 超過一造成
divergence。

在 tile coding 的使用上 :math:`\vec{\phi(s)}` 裡面的 :math:`\phi_k(s)`
會定成 :math:`\frac{1}{M}` 而不是像 onehot coding 的 1。
對收斂性會比較好。

如果我們找到的 coding 能夠用比原本的 state space 用比較少的 resource
計算且收斂，那麼這 :math:`\phi` function 就稱為 `contraction mapping` ，
就是壓縮的 representation。


Fuzzy Representation
**************************************************

有時候可以用 piece-wise linear function (折線型的那樣)。
作出 piece-wise linear function 的其中一個方法是 fuzzy set。
The element of a fuzzy set can partially belong to a set.

舉例來說，如果把溫度切成兩個 set: cold and warm。
那麼給你一個特定的溫度，我們會說它 partially cold and partially warm。

RL 中的 state space 或是 state-action space 可以切出 fuzzy set 來表示。
當然，其中最大的難處還是在定出 fuzzy set。


Non-linear Function Approximation
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Non-linear function approximation 某種程度上，
降低了 feature extraction/feature selection 的吃重程度、
requirement of domain knowledge。

Parametric non-linear function approximator

.. math::

    V_t(s) = V(\phi(s), \theta_t)

E.g. :math:`V` 可以是一個 NN。


Update Parameters
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

TD-learning 如果用了 linear 的 approximator，那麼有 close form solution
來 optimize，LSTD。


Gradient Decent
**************************************************

舉例來說，這裡的 error function :math:`E` 可以是個 TD error、
或是 prediction error。
我們先對 :math:`R` 做 parametrize

.. math::

    \bar{R}: S \times A \times \mathbb{R}^P \rightarrow \mathbb{R}

E.g.

.. math::

    \bar{R}(s_t, a_t, \theta_t)


那麼 error function 就簡單的定成距離：

.. math::

    E(s_t, a_t, \theta_t, r_{t+1}) = (\bar{R}(s_t, a_, \theta_t, r_{t+1}) - r_{t+1})^2


Update:

.. math::

    \theta_{t+1} \leftarrow \theta_t - \alpha_t \nabla_\theta E(\cdot, \theta_t)

Natural Gradient

    我們希望在更新的前後，model :math:`m_t` 與 :math:`m_{t+1}` 的 KL divergence
    要不變。就是透過調整 step size。
    這樣的整個 learning process 會比較 stable，避免 outlier 對 model parameter
    有過度的影響。
    Natural gradient 對 parameter transformation 有 invariant 的特性，
    如，把網路的 activation 從 sigmoid 換成 tanh，對 natural gradient 是沒差的。


Gradient-Free Optimization
**************************************************

在 function 不可微分的時候，或是已知會有很多 local optima 存在的時候，
會使用這類的技術。
像是 evolutionary algorithms、particle swarm optimization、cross-entropy
optimization 等。
本節介紹部分的 evolutionary methods 跟 cross-entropy optimization。

傳統的 evolutionary algorithm，基本上是對 population of solution 做
selection and mutation。
而 general 的方法則是，拿 parameter 的 distribution 得到 solution，而且對
distribution 本身做 selection and mutation，
就是對 distribution 做 optimization 而不是去 optimize solutions。
這樣的做法稱為 evolutionary strategies。
e.g.

- Covariance matrix adaptation evolution strategies (CMA-ES)

- Natural evolutionary strategies (NES)

- Cross-entropy optimization methods

對 evolutionary strategies 並沒有保證收斂。但這類的方法比較適合用在
Monte Carlo sampling。

General Algorithm of evolutionary strategies

    #. 有 parametrized PDF function :math:`q(\vec{x} | \vec{\theta})`

    #. Fitness function :math:`f(\vec{x})`

    #. Initial parameter :math:`\vec{\theta_0}`

    .. pseudo-code::

        \forall{$t \in 1, 2, \dots$}
            \state Construct (sample) population
                $X = \{\vec{x_1}, \vec{x_2}, \dots \}$,
                where $X \sim q(\cdot | \vec{\theta_t})$
            \state Use $f(\vec{x_i})$ to update $\vec{\theta_{t+1}}$
        \endfor


Approximate Reinforcement Learning
----------------------------------------------------------------------


Value Approximation
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

用 sample experience update value function。
在這個類別內再細分

- On-policy

- Off-policy

各式 Q-learning

    - Delayed Q-learning
    - :ref:`double-q`: 處理 overestimate 的問題
    - Phased Q-learning
    - Fitted Q-iteration


Objective Functions
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:math:`\mathscr{V}` is a function space, such that
:math:`V \in \mathscr{V}`.裡面是各種 function 的可能性。

:math:`\mathscr{F} \subset \mathscr{V}` 代表 function space of
function approximator.

如果這個 :math:`\mathscr{F}` 是一個很大的 subset，那麼
這個 function approximator 會很有彈性且精確，
但可能容易出現 overfitting 的問題。
反之，如果這個 subset 很小，那麼就會不精確。
通常來說 linear function 的 function space 比 non-linear function 的 space 小。

Parametric function 的參數 :math:`\theta` 會隨著 training 而調整，
其 function space 表示為：

.. math::

    \vec{\theta} = \{V(\cdot, \vec{\theta}) | \theta \in \Theta\}

Projection operator :math:`\Pi: \mathscr{V} \rightarrow \mathscr{F}`
把 value function map 到最接近的 function :math:`\mathscr{F}`
用 weighted norm 代表距離：

.. math::

    \| V - \Pi(V) \|_w = \min_{f \in \mathscr{F}} \| V - f \|_w =
    \min_\theta \| V - V^\theta \|_w

如，用 weighted L2 norm:

.. math::

    \| V - V^\theta \|_w = \int_{s \in S} w(s) \Big(V(s) - V^\theta(s) \Big)^2 \, ds

Projected Bellman equation

.. math::

    V^\theta \leftarrow B(\Pi(V^\theta))


Gradient TD Learning
**************************************************

TD learning 在 feature 不是 linear independent 的狀況下要導入
eligibility traces，其收斂性有被證明。

Greedy-GQ algorithm 這篇 extend Q-learning 到 linear function approximation
而且在某些條件下有保證收斂性。

Recall TD error

.. math::

    \delta_t = r_{t+1} + \gamma V_t(s_{t+1}) - V_t(s_t)

那麼如果在 gradient decent 的 context 中，就是 tangent line，就會用平方。
Error function in context of gradient:

.. math::

    E(s_t) = \frac{1}{2} \delta_t ^2

所以 gradient w.r.t. :math:`\theta`

.. math::

    \nabla_\theta E(s_t, \theta) = \delta_t \nabla_\theta \delta_t

如果視 :math:`r_{t+1} + \gamma V_t(s_{t+1})` 為與 :math:`\theta` 無關的
stochastic approximation (?) 那麼改寫 gradient 如下

.. math::

    \nabla_\theta E(s_t, \theta) = \delta_t \nabla_\theta V_t(s_t)

這個稱為 residual-gradient。

參數的 update 則是用 negative gradient

.. math::

    \theta_{t+1} \leftarrow \theta_t - \alpha_t \delta_t \nabla_\theta V_t(s_t)

這裡的 update rule 在收斂上會比上面的 residual-gradient update 快。
但是對於 off-policy 的 learning 會 diverge，對 linear or non-linear 的都會。

導入 trace

    #. 原本的方法

        .. math::

            \vec{e_{t+1}} & \leftarrow \lambda \gamma \vec{e_{t}} + \nabla_\theta V_t(s_t) \\
            \theta_{t+1} & \leftarrow \theta_t + \alpha_t(s_t) \delta_t \vec{e_{t+1}}

    #. Främling (2007) 的 improve，但缺乏理論上的證明

        .. math::

            \vec{e_{t+1}} \leftarrow \max(\lambda \gamma \vec{e_t}, \nabla_\theta V_t(s_t))

