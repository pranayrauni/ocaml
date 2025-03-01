
(* We can create a single mutable value by using a ref. The ref type comes predefined in the standard library, but there’s nothing really special about it. 
It’s just a record type with a single mutable field called contents:  *)

let x = { contents = 0 };;

x.contents <- x.contents + 1;;

x;;


let x = ref 0  (* create a ref, i.e., { contents = 0 } *);;

!x             (* get the contents of a ref, i.e., x.contents *);;

x := !x + 1    (* assignment, i.e., x.contents <- ... *);;

!x;;



(* refs reimplemented *)
type 'a ref = { mutable contents : 'a };;

let ref x = { contents = x };;

let (!) r = r.contents;;

let (:=) r x = r.contents <- x;;



(* 
(* no t good way to sum a list *)
let sum list =
  let sum = ref 0 in
  List.iter list ~f:(fun x -> sum := !sum + x);
  !sum;;
 *)
