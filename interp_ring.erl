-module(interp_ring).

-export([main/3]).

main(N,Pids,M) when N > 0->
    io:fwrite("At Least Got Here! ~n"),
    io:fwrite("Length of Process List: ~w ~n",[length(Pids)]),
    Pid = spawn(interp_ring, ring, []),
    io:fwrite("Just spawned a new  process! ~n"),
    main(N-1,[Pid|Pids],M);

main(N,Pids,M) when N =:= 0->
    Pid = spawn(interp_ring, ring, []),
    io:fwrite("Spawning Last Process! ~n"),
    Pid ! ({Pids, hello,M}).

ring() ->
    receive 
        {Pids,Msg,M} when M>0 ->
            [Nextpid|PidList]=Pids,
            Nextpid ! {PidList, hello,M-1}, 
            ring();
        {Pids,Msg,M} when M =:=0 ->
            [Nextpid|PidList]=Pids,
            Nextpid ! { PidList, stop,0}
      %  {Pids,stop,M} when M =:=0 ->
      %      [Nextpid|PidList]=Pids,
      %      Nextpid ! { PidList, stop,0}
    end.
