**MXNet**
  * [ ] ploting cost function
    * http://dmlc.ml/MXNet.jl/latest/api/callback/
  * [ ] etc

**idea**
  * [ ] classification 用 regression 的 \theta 做 othogonal ?
      * adaboost 的 learner 用 regression othogonal \theta?
  * [x] ~嘗試用 MSE for logistic regression 畫出奇形怪狀的 error function 。 Andrew Ng 說 MSE for logistic regression is non-convex, really?~

  * [ ] pickup concept of reinforcement learning

  * [ ] pickup concept of RNN, LMST training

  * [ ] try out Polly https://polly.llvm.org/
    * [ ] compile with julia

  * [ ] YQL
    * https://developer.yahoo.com/yql/guide/running-chapt.html
    * https://developer.yahoo.com/yql/console/?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22YHOO%22%2C%22AAPL%22%2C%22GOOG%22%2C%22MSFT%22)&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys
    * add for `MarketData.jl` ?

  * [ ] math optimization
    * https://github.com/JuliaNLSolvers

  * [ ] cluster
    * 國網中心用 LSF
    * http://jura.wi.mit.edu/bio/education/hot_topics/lsf/Running_jobs_on_Linux_Cluster.pdf
    * WRDS 用 GridEngin https://zh.wikipedia.org/wiki/Oracle_Grid_Engine


**CouchDB**

  * [ ] capp-market
    * [ ] plot via ChartJS

  * [ ] update ZMQ doc

  * course note
     * pricing
       * beta: CAPM
       * volatility
       * tracking error (?)


**FreeBSD**

   * [ ] fix lang/julia build in current

   * [ ] update mosquitto to 1.4.12


**Misc**

  * 5/15 期貨電子盤
    * https://www.taifex.com.tw/chinese/event/afterhourstrading/index.asp
    * ~~check txf.py~~

  * TimeSerise.jl
     ```
     TimeArray(StepRange{Date}, ...)
     ```

  * https://bugs.archlinux.org/task/53499?project=0&order=id&sort=desc&string=tar

  * [ ] check rss
     https://arxiv.org/

  * [ ] 試一下　realtime pushing 的能力
    * https://github.com/rethinkdb/rethinkdb

**Paper**

  * [ ] Deep Direct Reinforcement Learning for Financial Signal Representation and Trading

  * [ ] Reinforcement learning and savings behavior

  * [ ] Performance functions and reinforcement learning for trading systems and portfolios

  * [ ] Learning to trade via direct reinforcement

  * [ ] An automated FX trading system using adaptive reinforcement learning

  * [ ] Learning competitive pricing strategies by multi-agent reinforcement learning

  * [ ] Intraday FX trading: An evolutionary reinforcement learning approach

  * [ ] A comprehensive survey of multiagent reinforcement learning

  * [ ] Stock trading with cycles: A financial application of ANFIS and reinforcement learning

  * [ ] Reinforcement learning in energy trading game among smart microgrids

  * [ ] Reinforcement learning for constrained energy trading games with incomplete information

  * [ ] Pairs trading strategy optimization using the reinforcement learning method: a cointegration approach

  * [ ] Algorithm Trading using Q-Learning and Recurrent Reinforcement Learning

  * [ ] Accelerating Multiagent Reinforcement Learning by Equilibrium Transfer

  * [ ] FMRQ—A Multiagent Reinforcement Learning Algorithm for Fully Cooperative Tasks


**Weekend Project**

  * [ ] BinDeps
  * [ ] CouchApp
  * [ ] Julia issue
  * [ ] MarketTA.jl
      * add plot recipe

  * [ ] FreeBSD Oatuh
  * [ ] VerneMQ

**2017/07/28**
  * [x] ~~fix maxrss~~
  
**2017/07/30**

  * [x] Julia old Document banner:
      https://github.com/JuliaLang/julia/issues/22936
      
**2017/07/31**

  * [ ] SlackGadfly
      * [ ] port DandelionWebsockets
           * [ ] test it on 0.7

  * [ ] MarketTA: Renko

  * [ ] HDF5.jl BSDpkg

  * [ ] freebsd ci time limit: 2hr
  
  * [ ] https://github.com/JuliaLang/julia/issues/22004
  
  * [ ] fix julia ipv6 const
  
  * TimeSeries
      * [ ] upgrade plot recipe
      * [ ] check julia typed exceptions

  * [ ] idea: `@recipe (x, y) ->`
  
  * [ ] check Evolutionary.jl
    https://github.com/wildart/Evolutionary.jl
