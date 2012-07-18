-module(riak_connector).

-export([connect/0]).

connect() ->

    {ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8081),

    riakc_pb_socket:ping(Pid).
