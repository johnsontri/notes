-module(cat_fsm).

-compile(export_all).

-behaviour(gen_fsm).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  public api
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start() ->
  {ok, Pid} = gen_fsm:start(?MODULE, [], []),
  Pid.


stop(Pid) ->
  gen_fsm:stop(Pid).


poke(Pid) ->
  gen_fsm:sync_send_event(Pid, poke, 5000).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  export for generic fsm framework
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init(_) ->
  {ok, meow, data, 5000}.


terminate(_, _, _) ->
  ok.


meow(timeout, _Data) ->
  io:format("meow~n"),
  {next_state, meow, [], 5000};

meow(Unknown, _Data) ->
  io:format("meow ~p~n", [Unknown]),
  {next_state, meow, [], 5000}.


meow(poke, _From, _Data) ->
  {reply, jump, meow, [], 5000}.


code_change(_OldVer, _State, _Data, _Extra) ->
  %% do nothing
  {ok, meow, []}.
