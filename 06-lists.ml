[];;     (* a list of elements of type alpha... alpha bcoz nothing is in it *)

[1];;
[1; 2];;
[1.; 2.; 4.; 5.];;    (* float list *)
[true; false];;
[[2; 3]; [3; 5]; [8; 9]];;

1 :: [4; 5];;    (* item inserted into list*)
1 :: 2 :: 3 :: [];;


(* Ocaml list

- immutable
- singly-linked: good for sequential access of short-to-medium length lists(say upto 10k)
                 data structures are tools; none is perfect.


*)
(* 

[] is pronounced "nil"
:: is pronounced "cons"

All elements of list should have same type.

*)


let languages = ["OCaml";"Perl";"C"];;            (* list example *)

List.length languages;;                 
List.map String.length languages;;           (* har string ka length btayga.. map traverse karne k liye use kiya gya hai *)
(* List.map languages ~f:String.length *)          (* use of labeled argument... needs base library *)


"French" :: "Spanish" :: languages;;

[1;2;3] @ [4;5;6];;


List.map (fun x -> x + 1) [1;2;3];;

List.map ~f:((+) 3) [4;5;6];;








(* The purpose of List.exists is to check if there are any elements of the list in question for which the provided function evaluates to true.  *)

(*  List.iter *)

(*  use of patterns on the left-hand side *)
(* let (ints,strings) = List.unzip [(1,"one"); (2,"two"); (3,"three")];;      (*Base required *) *)
(* Using a pattern in a let binding makes the most sense for a pattern that is irrefutable, i.e., 
where any value of the type in question is guaranteed to match the pattern. Tuple and record patterns are irrefutable, but list patterns are not. *)
