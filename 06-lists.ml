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