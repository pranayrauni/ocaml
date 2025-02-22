(* Functional queues as list  *)

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


let q : int list = ListQueue.(empty |> enqueue 42 |> dequeue |> enqueue 43)


(* This opeartor is avilable in standard library under name of Option.map *)
let ( >>| ) opt f =           (* operator takes option and function. if option is Some then it is gonna apply f to x. *)
match opt with
 | None -> None
 | Some x -> Some (f x)


(* Option.bind *)
let ( >>= ) opt f = 
  match opt with 
  | None -> None
  | Some x -> f x

let q option = 
  ListQueue.(empty |> enqueue 42 |> dequeue >>| enqueue 43 >>= dequeue)

(* To tackle linear time problem we can use two-list queue.

[{front = [a;b]; back = [e;d;c]}] 
represents the queue a, b, c, d, e.
If [front] is empty then [back] must also be empty, to gurantee that that first element of the queue is always the head of [front].
*)

module TwoListQueue = struct
  type 'a queue = {
    front : 'a list;
    back : 'a list;
  }

  let empty = {
    front = [];
    back = [];
  }

  let peek = function 
    | {front = []} -> None
    | {front = x :: _} -> Some x

  let enqueue x = function 
    | {front = []} -> {front = [x]; back = []}
    | q -> {q with back = x :: q.back}      (* if queue is not empty then insert element at head of back field. constant time.  *)

  let dequeue = function
    | {front = []} -> None
    | {front = _ :: []; back} -> Some {front = List.rev back; back = []}
    | {front = _ :: t; back} -> Some { front = t; back}       (* remove element from head of front *)
    (* constant time except when front gets exhausted *)
end