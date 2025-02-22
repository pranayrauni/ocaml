(* Modular programming: 
  - develop separately 
  - understand in isolation
  - reason locally, not globally


Features of modularity: 
  - Structures, like classes in java
  - Signatures, like interfaces in java
  - Abstract type, like encapsulation
  - functors and includes for code reuse
*)

(* In both, MyList and tree, map has been used. if we want to use MyList then it will create problem bcoz map will be shadowed to last map used. To counter 
  this problem moudule and struct can be used. *)

module MyList = struct
  type 'a mylist = 
    | Nil 
    | Cons of 'a * 'a mylist

  let rec map f = function 
    | Nil -> Nil
    | Cons (h, t) -> Cons (f h, map f t) 
end

module Tree = struct
  type 'a tree = 
    | Leaf 
    | Node of 'a * 'a tree * 'a tree

  let rec map f = function 
    | Leaf -> Leaf
    | Node (v, l, r) -> Node (f v, map f l, map f r)
end


let lst = MyList.map succ (Cons (1, Nil))

let t = Tree.Node (1, Leaf, Leaf)    (* Another way  let t : int Tree.tree = Node (1, Leaf, Leaf) *)