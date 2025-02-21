(* Exceptions are extensible variants.

type exn

All exceptions are values of that type.

Defining exception: 

exception ABadThing
exception OhNo of string

This behaves as constructor of type exn.

type exn is built-in extensible variant.

*)


exception OhNo of string;;
OhNo "oops";;

(* raise (OhNo "oops");; *)  (*  raising an exception *)

(* 1/0;; *)

(* while raising exception it is not necessary to carry any extra data like error message *)

(* Built-in function raise : exn -> 'a

The expression in which you wrote raise is itself never goin to produce a real value. It is not gonna return any value instead exception get raised.
That is why return type of raise is alpha. We can treat is as having any type we want.

*)

(* let x : int = raise ABadThing;;   
There will never be integer produced by raise tha could get stored inside of x.
*)


(* Predefined exceptions

exception Failure of string
  Exception raised by library functions to signal that they are undefined on the given arguments.
  Built-in function      failwith : string -> 'a



exception InvalidArgument of string
  Exception raised by library functions to signal that the given arguments do not make sense
  Built-in function    invalid_arg : string -> 'a

*)

(* raise (Failure "error message");; *)
(* above and below line do same thing *)
(* failwith "error message";; *)



(* Handling exception that is raised is matter of pattern maatching bcoz exceptions are variants. *)

let safe_div x y = 
  try x / y with
  | Division_by_zero -> 0;;

safe_div 3 0;;



(* Try expressions 

try e with
  | p1 -> e1
  | p2 -> e2


if none matches reraise
*)


