let x = 23;;
x;;

let y = 45;;
y;;

x+y;;


(* donot start an identifier with capital letter. *)


(* (let a = 12) + 1;;    *)   (* error*)

(let b = 13 in b) + 2;; 

let c = 3 in 2*c;;     (* 6 - 3 is bound to c then evaluation continued by evaluating 2 times of c i.e. 3 *)


(* in above case value of b is 13 in b and not anywhere else. This gives sense of scope. both b and c are not bounded outside. *)

let d = 5 in (let e = 6 in d + e);;      (* 11 *)

(* let f = 3 in (let f = 2 in f);;    *)   (*error unused variable*)

(* normally jo let likha gya hai usko toplevel let in kar k samjhta hai *)

(* Principle of name irrevalance:  name of the variable should not intrinsically matter. *)

(* To ensure name irrevalance in programs stop substituting when you reach a binding of the same name. let g = 5 in (let g = 6 in g )    /6 *)


let h = 1;;
let h = 2;;
h;;               (* it seem like mutability but it is just nested scope using "in"*)

(* let h = 1 in let h = 2 in h;; *)     
(* no mutability.. allocating new piece of memory being referred to same name *)


