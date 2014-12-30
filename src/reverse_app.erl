-module(reverse_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_Type, _Args) ->
  {ok, _} = ranch:start_listener(
    reverse, 10, ranch_tcp, [{port, 5555}], reverse_protocol, []),
  reverse_sup:start_link().

stop(_State) ->
  ok.
