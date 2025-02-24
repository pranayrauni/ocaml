(* module values and regular values are distinct in ocaml. we can not mix and match between them. there we can not have functions on modules.

There is something that is alot like a function that is called functor.

A functor is just a module level function.
It can take module as input and produce a module as output. 
*)

module type X = sig
  val x : int
end

module A : X = struct
  let x = 0  
end

(* Suppose I want to create another module just like module A except its x is one bigger. It means I want to write function that takes module A and produces new module
   wirh little change.  *)

module IncX = functor (M : X) -> struct             (* functor takes module value M and specified to have module type X. module value that is returned is structure. *)
  let x = M.x + 1            (* structure creates a value named x and it binds to whatever x was inside of input functor plus 1 *)
end


(* In utop we can use the module definition syntax to bind the result of functor application to module name *)
module B = IncX(A);;
B.x;;     (* 1 *)
A.x;;      (* 0 *)

module C = IncX(B);;
C.x;;     (* 2 *)


(* Syntactic sugar *)
module IncX (M : X) = struct
  let x = M.x + 1
end