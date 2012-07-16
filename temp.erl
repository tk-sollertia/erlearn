-module(temp).
-export([f2c/1]).
-export([c2f/1]).
-export([convert/1]).

f2c(Value) ->
	((Value-32)*5)/9.

c2f(Value) ->
	(Value*9)/5+32.

convert({f,Value}) ->
	((Value-32)*5)/9;

convert({c,Value}) ->
	(Value*9)/5+32.
