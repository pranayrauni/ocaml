let rec sum = function 
  | [] -> 0
  | h :: t -> h + sum t;;

let rec concat = function
  | [] -> ""
  | h :: t -> h ^ concat t;;


  (* we see repetitive code now can use combine  *)

  let rec combine init op = function 
    | [] -> init
    | h :: t -> op h (combine init op t);;

  let sum' lst = combine 0 ( + ) lst;;
  sum' [1;3;4];;
  let concat' lst = combine "" ( ^ ) lst;;
  concat' ["fg"; "de"];;


(* combining elements using init and op is essential idea behind library functions known as fold. fold is close cousin of reduce. *)