(* option: A built-in variant 

type 'a option = None | Some of 'a

*)

None;;

Some 1;;

Some [1;2;3];;


let get_val o = match o with
  | None -> failwith "??"
  | Some x -> x

(* since we donot know what to return in case nothing is present inside so we will take default value from programmar *)

let get_val default o  = match o with     (* we can remove match with function*)
  | None -> default
  | Some x -> x




(* Find max element in a list *)
let rec list_max (lst : 'a list) : 'a option =
  match lst with 
  | h :: t -> begin
      match list_max t with
      | None -> Some h
      | Some m -> Some (max h m)
    end 
  | [] -> None

let x = list_max [1;2;3]
let x = list_max []

