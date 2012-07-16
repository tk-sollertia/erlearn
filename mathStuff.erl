-module(mathStuff).
-export([perimeter/1]).

perimeter({square, Side})->
	Side*4;
perimeter({circle,Radius})->
	3.14*2*Radius;
perimeter({triangle,A,B,C})->
	A+B+C.

