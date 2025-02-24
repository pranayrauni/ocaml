(* Earlier we were implementing modules and modules types within dot ml file. There is another way to do it without module type and module keyword. That is to factor out the
  the code into two separate files. One is dot mli file and second is dot ml file.

  Idea is to put signature in dot mli file, it's interface to module and put implementation in dot ml file.



  (* Following will be written in dot mli file *)


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



(* Following will be written in dot ml file *)

  type 'a stack = 'a list

  let empty = []

  let push x s = 
    x :: s

  let peek = function 
    | [] -> failwith "empty"
    | x :: _  -> x

  let pop = function 
    | [] -> failwith "empty"
    | _ :: xs -> xs

*)


(* This factering of code into two files is known as compilation unit. 

compilation unit = myfile.ml + myfile.mli

If myfile.ml has contents DM [and myfile.ml has contents DS] then ocaml compiler behavies essentially though: 

module MyFile [ : sig DS end] = struct
  DM
end

*)

