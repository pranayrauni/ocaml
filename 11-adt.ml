(* use record - in case of AND
  use variant - in case of OR

  It is possible to know from which set a value came from if we use variant.

*)


(* Variants are also known as algebraic data type bcoz it allows sum and product. *)

(* ADT for Pokemon *)

type ptype = TNormal | TFire | TWater
type peff = ENormal | ENotVery | ESuper

let mult_of_eff = function
  | ENormal -> 1.0
  | ENotVery -> 0.5
  | ESuper -> 2.0

let eff = function
  | (TFire, TFire) | (TWater, TWater) | (TFire, TWater) -> ENotVery              (* Tags are witten in OR *)
  | (TWater, TFire) -> ESuper
  | _ -> ENormal;;

eff (TFire, TFire);;
(* Above and below codes give same result. Above we have to give two tags mandatory in tuple to get result while  below we give tags separately to get result.  *)
let eff t1 t2 = match t1, t2 with
  | TFire, TFire | TWater, TWater | TFire, TWater -> ENotVery
  | TWater, TFire -> ESuper
  | _ -> ENormal;;

eff TFire TFire;;


(* Recursive parameterized variant *)

type intList = 
  | Nil 
  | Cons of int * intList


let rec length = function
  |  Nil -> 0
  | Cons (_, t) -> 1 + length t;;

length (Cons (1, Cons (2, Nil)));;

(* now suppose we want list like this for string, bool etc so we have to write various name for parameters like length_string, length_bool. To solve this issue we will use alpha list *)
type 'a mylist = 
  | Nil
  | Cons of 'a * 'a mylist
(* we can use [] for nil and :: for cons *)
let rec length = function
  | Nil -> 0
  | Cons (_, t)  -> 1 + length t;;

length (Cons (1, Nil));;
length (Cons (true, Nil));;

(* Standard library implementation of list:

type 'a list = [] | (::) of 'a * 'a list


ocaml built-in singly linked list is recursive parameterized variant.

here list is type constructor parameterized on type variable 'a

[] :: are constructors.

*)
