(* An interface is collection of names and specifications about those names. Ocaml has similar features called signatures.

Simple words, interface template ki tarah kaam kar rha hai... Type annotation se esme ka sara naam jaise ki 'fact' baki k code m jayga aur use hoga. 
matlab ki yaha signature create liya jaa rha hai baad m check hoga ki signature match ho rha hai ki nhi using that val names types etc.

Signature matching ensure everything specified in sig must be defined in Mod with right types.

Encapsulation: Only what is specified in sig can be accessed outside module. The module is sealed.

The types in Mod must be the same as those in Sig or more general.
*)


module type Fact = sig         (* here type of module is specified. This block is called signature. module tppe is where we document all of the specifications about what functions are supposed to do*)
  (* [fact n] is [n] factorial. *)
  val fact : int -> int
end


module RecursiveFact : Fact = struct 
  let rec fact n =
    if n = 0 then 1 else
      n * fact (n-1)
    end

(* module NoFact : Fact = struct 
  let inc x = x + 1                      (* module type ko fact function chahiye jo ki struct provide nhi ka rha to error aa rha *)
end *)


module TailRecursiveFact : Fact = struct   (* when we put module type annotation on this module we are not only saying it must provide all of names from interface we are saying those are only ones that will be exposed to rest of the world.
                                               Because the fact only metions function fact not function fact_aux, fact_aux is kept hidden inside TailRecursiveFact. If type annotation is removed then compilation error will go away bcoz fact_aux is no longer being hidden. *)
  let rec fact_aux n acc = 
    if n = 0 then acc else 
      fact_aux (n-1) (n * acc)

  let fact n = 
    fact_aux n 1
end

let x = TailRecursiveFact.fact 10

(* let x = TailRecursiveFact.fact_aux 10 *)





(* Module type for stack *)
module type ListStackSig = sig
  (* [empty] is empty stack. *)
  val empty : 'a list

  (* [push x s] is [s] with [x] pushed on top.  *)
  val push : 'a -> 'a list -> 'a list

  (* [peek s] is top element of [s].
      Raises [Failure] if [s] is empty. *)
  val peek : 'a list -> 'a

  (* [pop s] is all but top element of [s].
      Raises [Failure] if [s] is empty. *)
  val pop : 'a list -> 'a list
end


module ListStack : ListStackSig = struct
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



(* Above signatues was written specifically for ListStack. it can not be implemented for stack. we need to generalize this. *)

module type StackSig = sig

  (* ['a stck] is the repesentation type for stacks. *)
  type 'a stack

  (* [empty] is empty stack. *)
  val empty : 'a stack

  (* [push x s] is [s] with [x] pushed on top.  *)
  val push : 'a -> 'a stack -> 'a stack

  (* [peek s] is top element of [s].
      Raises [Failure] if [s] is empty. *)
  val peek : 'a stack -> 'a

  (* [pop s] is all but top element of [s].
      Raises [Failure] if [s] is empty. *)
  val pop : 'a stack -> 'a stack
end

module MyStack : StackSig = struct
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




(* now module type and signatues for queue *)

module type Queue = sig
  (* ['a queue] is representation type of queues *)
  type 'a queue

  (* [empty] is empty queue. *)
  val empty : 'a queue

  (* [enqueue x q] is [q] with [x] at end of the queue *)
  val enqueue : 'a -> 'a queue -> 'a queue

  (* [peek q] is [Some x] where [x] is front element of [q] or [None] if [q] is empty. *)
  val peek : 'a queue -> 'a option

  (* [dequeue q] is [Some q'] where [q'] is all but front element of [q] or [None] is [q] is empty. *)
  val dequeue : 'a queue -> 'a queue option
end

module ListQueue = struct
  type 'a queue = 'a list
  
  let empty = []

  let enqueue x q = 
    q @ [x]               (* linear time *)
    
  let peek = function 
    | [] -> None
    | x :: _ -> Some x             (* peek gets first element *)

  let dequeue = function 
    | [] -> None
    | _ :: q -> Some q              (* dequeue gets last element *)
end

(* here we are matching signature with another way *)
module ListQueue : Queue = ListQueue

(* we can do the same thing for TwoListQueue *)









(* Abstract types 

module type Stack = sig
  type 'a stack


'a stack is abstract: signature declares only that is exists but does not define what it is.

Every module of type Stack must define the abstract type. 


Abstract type gives encapsulation:
 - Clients do not need to know queue is implemented with list. clients will exploit if they know.
  - what if implementers want ot upgrade to two-list queues?
    - If list implementaion is hidden they can freely change. 


 To prevent any issue then use type 'a t instead of type 'a stack everywhere.

 module type StackSig = sig

  (* ['a stck] is the repesentation type for stacks. *)
  type 'a t

  (* [empty] is empty stack. *)
  val empty : 'a t

  (* [push x s] is [s] with [x] pushed on top.  *)
  val push : 'a -> 'a t -> 'a t

  (* [peek s] is top element of [s].
      Raises [Failure] if [s] is empty. *)
  val peek : 'a t -> 'a

  (* [pop s] is all but top element of [s].
      Raises [Failure] if [s] is empty. *)
  val pop : 'a t -> 'a t
end



*)
