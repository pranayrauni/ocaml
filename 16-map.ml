(* Map *)

let rec add1 = function
  | [] -> []
  | h :: t -> (h + 1) :: add1 t;;

let rec concat3110 = function
  | [] -> []
  | h :: t -> (h ^ "3110") :: concat3110 t;;


(* In both of code above we can see repeated code. it can be solved using map. *)

let rec map f = function
  | [] -> []
  | h :: t -> f h :: map f t;;

let add1' lst = map (fun x -> x + 1) lst;;
let concat3110' lst = map (fun x -> x ^ "3110") lst;;

add1' [5; 6];;
concat3110' ["hello"];;

let stringlist_of_intlist lst = map string_of_int lst;;
stringlist_of_intlist [1;2;3;4;5];;


(* Abstraction principle: Factor out recurring code patterns. Dont duplicate them. *)