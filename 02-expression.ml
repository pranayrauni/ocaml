123;;              (* it will be evaluated as int 123    *)

123 > 453;;        (* false *)

"hello";;           (* string*)

"hello" ^ "world";;   (* string cancatenation*)

5 * 8;;       (* use asterik if there are integers *)

4.0 *. 3.4;;           (* to get result in float use *. for multiplication  *)
(* use of dot after * is design choice by language designer. it is not to overload operator in ocaml. *)

(* A value is an expression that does not further evaluation. *)

(* Type Inference and annotation 

Ocaml compiler infers type
      - compilation fails with type error if it can not
      - hard part of language design: guranteeing compiler can infer types when program is correctly written.  

      summary: you dont have to write type of expressions as much as you would do in other languages.

      Ocaml does type checking at compile time not runtime.

      
*)

(* Although we can write of expression anywhere *)
(5 : int);;           (* it is not type casting. it is type annotation. literally telling compiler to check the type. *)


let () = print_endline "hello"
let x = 2;;

let y = true;;