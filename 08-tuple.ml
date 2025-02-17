(* tuple is unnamed component *)

(10, 20, "pm")


(* we can give name *)

type time = int * int * string

let t = (10, 20, "pm")

type point = float * float

let p = (5., 2.5)

(* thing that work only on pairs

fst p     gives first compoent of p
snd p     gives second component of p

*)



(* Comparison of data types

Unounded: use list
Bounded: use tuple or record
acess by position: tuple
access by name: record

*)


