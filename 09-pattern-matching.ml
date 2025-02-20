match not true with | true -> "nope" | false -> "yep";;

(* those are called branches  *)

let x = 
  match not true with
  | true -> "nope"
  | false -> "yep"


let y = 
  match 42 with 
  | fooo -> fooo


let z = 
  match "foo" with              (* here string is being matched*)
  | "bar" -> 0
  | _ -> 1                    (* use underscore for none of above *)


let a =  
  match [] with                   (* empty list match *)
  | [] -> "empty"
  | _ -> "not empty"



let b = 
  match ["taylor"; "swift"] with
  | [] -> "folklore"
  | h :: t -> h           (* here h and t is nothing but for head(first item) and tail(rest of items) *)


let c = 
  match ["taylor"; "swift"] with
  | [] -> ["folklore"]
  | h :: t -> t         (*"swift" is being considered as string list while "taylor" as list *)



let fst3 t =               (*matching tuple *)
  match t with 
  | (a, b, c) -> a;;

fst3 (1, 2, 3);;       (* output:  1 *)


let empty lst =
  match lst with
  | [] -> true
  | h :: t -> false        (* It can be just written with underscore too *)


  (* to find sum of elements in a list *)
  let rec sum lst = 
    match lst with
    | [] -> 0
    | h :: t -> h + sum t;;

sum [];;
sum [1; 2; 3];;
(* #trace sum;; *)     (*it will show what is happening under the hood.*)
(* sum [1;2;3];; *)
(* #untrace sum;; *)


(* to find length of a list *)
let rec length lst = 
  match lst with
  | [] -> 0
  | h :: t -> 1 + length t;;

length [];;
length [1;2;3];;
  


(* append a list: new list is created. [1;2;3] [4;5;6] [1;2;3;4;5;6]*)

let rec append lst1 lst2 = 
  match lst1 with 
  | [] -> lst2
  | h :: t -> h :: (append t lst2);;

append [1;2;3] [4;5;6];;
(* above and below lines give same result *)
[1;2;3;4] @ [5;6;7];;    (* append is available as built-in operator witten as single @ *)



(* Function keyword: Immediately matching against implicit final argument is so useful there is sugar for it:  


let f x y z = 
  match z with 
  | p1 -> e1
  | p2 -> e2

can be written as 

let f x y = funcion 
  | p1 -> e1
  | p2 -> e2


possible only if last argument is matched

*)


let empty = function 
  | [] -> true
  | _ -> false



let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t;;

sum [];;
sum [4;5;6];;


let rec length = function
  | [] -> 0
  |  h :: t -> 1 + length t;;

length [3;4;5];;

(* It is not possible in case of append bcoz first argumnent is being matched. *)


(* 

:: vs @

:: 
- "cons"
- add an element onto haed of a list
- 'a -> 'a list -> 'a list
- constant time O(1)


@
- "append"
- combines two lists and give new list
- 'a list -> 'a list -> 'a list
- linear time in first list: 
    for lst1 @ lst2 it is O(length lst1)

*)

(* If no pattern is matched raise an exception Match_failure *)

(* type checking

match e with 
  | p1 -> e1
  | p2 -> e2  
  | p3 -> e3
  | pn -> en

  If e and pi has type ta and ei have type tb then entire match expression has type tb.

  matching happens from top to bottom.

*)


(* Semantics of pattern matching:

  - a constant matches itself
  - an identifier aka pattern variable matches anything and binds it in scope of the branch
  - the underscore aka wildcard matches anything but does not bind it

*)

(* Ocaml compiler checks: 
  - exhaustiveness of patterns
  - unused branches
 *)


