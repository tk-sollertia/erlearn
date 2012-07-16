-module(lists1).
-export([min/1]).

min([H|T])-> 
	if 
		H<min(T) -> H;
		H>min(T) -> min(T)
	end.

	
	
