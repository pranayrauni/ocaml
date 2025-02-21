(* here binay tree is similar like alpha mylist where nil and cons was tagg *)

type 'a tree = 
  | Leaf 
  | Node of 'a * 'a tree * 'a tree      (* two 'a  tree bcoz of second child *)

let t = 
  Node (2, 
        Node (1, Leaf, Leaf),
        Node (3, Leaf, Leaf))

(* tree

         2
       /  \
      1   3
*)

(* 
let rec size = function
  | Nil -> 0
  | Cons (_, t) -> 1 + size t
*)

let rec size = function
  | Leaf -> 0
  | Node (_, l, r) -> 1 + size l + size r;;


(* 
let rec sum = function
  | Nil -> 0
  | Cons (h, t) -> h + sum t
*)

let rec sum = function
  | Leaf -> 0
  | Node (v, l, r) -> v + sum l + sum r








(* Suppose we want o map over a tree *)
let rec map f = function 
  | Leaf -> Leaf
  | Node (v, l, r) -> Node (f v, map f l,map f r)

let add1  t = map succ t

(* fold over tree *)
let rec fold acc f = function 
  | Leaf -> acc
  | Node (v, l, r) -> f v (fold acc f l) (fold acc f r)

let sum t = fold 0 (fun x y z -> x + y + z);;
add1 t;;
sum t;;