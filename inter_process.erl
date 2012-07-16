-module(inter_process).

-export([main/1,pr1/0,pr2/0]).

main(N)->
    Pid1 = spawn(inter_process,pr1,[]),
    Pid2 = spawn(inter_process,pr2,[]),

    Pid1 ! {hello,N,Pid2}.


pr1() ->

    receive 
        {hello,Count,Pid} when Count >0 ->
            io:fwrite("Just received a hello! ~n"),
            Pid ! {helloback,self(),Count},
            pr1();
        {hello,Count,Pid} when Count =:= 0 ->
            io:fwrite("Just received a final hello! ~n"),
            Pid ! {lastone,self(),0}
    end.

pr2() ->
    
    receive 
        {helloback,Pid3,NewCount} ->
            Pid3 ! {hello, NewCount-1,self()},
            io:fwrite("replied duder ~n"),
            pr2()
    end.

