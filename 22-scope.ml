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


let x = ListStack.peek (ListStack.push 42 ListStack.empty)     (* here ListStack is getting repeated. *)
let y = ListStack.(peek (push 42 empty))     
let z = ListStack.(empty |> push 42 |> peek)

let w =                                               (* another way to write using open. everything from ListStack is in scope. *)
  let open ListStack in 
  empty |> push 42 |> peek

open ListStack                 (* another way to write that in more global open unlike above local open. This method is discouraged as in case of two modules with same name there will be shadowing bcoz of empty stack. *)
let v = empty |> push 42 |> peek