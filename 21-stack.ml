(* stack data structure *)

module MyStack = struct
  type 'a stack = 
    | Empty
    | Entry of 'a * 'a stack      (* first comaponent of pair is actual value on the stack at that point and second component is rest of the stack *)

  let empty = Empty 

  let push x s =
    Entry (x, s)

  let peek = function              (* it tells the value of top of the stack *)
    | Empty -> failwith "Empty"
    | Entry (x, _) -> x


  let pop = function 
    | Empty -> failwith "Empty"
    | Entry (_, s) -> s
end


(* Implementing stack as a list *)
module ListStack = struct
  type 'a stack = 'a list

  let empty = []

  let push x s = 
    x :: s

  let peek = function 
    | [] -> failwith "empty"
    | x :: _  -> x

  let pop = function 
    | [] -> failwith "empty"
    | _ :: s -> s
end

let s = ListStack.empty
let s' = ListStack.push 1 s          (* pushing creates new stack leaving old stack unchanged. Same in case of pop. *)
let x = ListStack.peek s'


(* Functional data structure: 
  - No mutable update: operations take on "old" value and return "new" value
  - Functional data structure are persitent rather than ephermal
  - Efficiency: space - ocaml compiler makes sure persitent data structure shres same memory as ephermal
                time - sometimes persitent data structure takes more time. it is huge overload to pay as you get other benefits as well.
*)


(* 
module ModuleName = struct
  definitions 
end


- Definitions can be anything let, type, exception, module
- can not be terminated  by ;; but not idiomatic
- To evaluate a structure, evaluate each definition in order top-to-bottom. Result is a module value aka module which binds name to values. 


- can not use use module in place of value or v-v.
-  can not bind module to name with let
- can not pass module to function as parameter
- can not return module from function as output

*)



