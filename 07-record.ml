(* record is dtatype built in ocaml. allows to aggregate data together. *)

type student = {
  name : string;
  year : int;
} 


let rbg = {
  name = "rauni";
  year = 2023;
};;

(* rbg.name;; *)
(* field names are identifiers not expressions.  *)

(* Record copy:

{e with f1 = e1} creates a copy of record e with new field value for f1.

{e with f1=e1; f2=e2; f3=e3}


This is not mutation: original record unchanged.
*)




(*pattern matching in record *)
let name_with_year s =
  match s with 
  | {name; year} -> name ^ " '" ^ string_of_int year;;

name_with_year rbg;;


(* mutable record *)
type running_sum =
  { mutable sum: float;
    mutable sum_sq: float; (* sum of squares *)
    mutable samples: int;
  }
