(fun x-> x +1 );;      (*anonymous function *)

(fun x-> x +1 ) (12);;      (*anonymous function taking parameters... paranthesis not mandatory*)


(fun x y -> (x +. y) /. 2.0) 24. 45.;;      (* finding average of two floating point numbers*)

(* in anonymous function body is not evaluated until function is applied. *)


(* anonymous function has another name called lambda expressions. *)


(* Example of function application *)

(* at first expression of function is evaluated then arguments is evaluated and then replaced  *)

(fun a-> a + 1) (2 + 3);;
(* (fun x-> x + 1) 5;; *)
(* 5+1;; *)


(fun x y -> x + y) (3*2) (4-1);;
(* (fun x y -> x + y) 6 3;; *)
(* 6+3;; *)




(* Named function *)

let inc = fun x -> x + 1;;        
inc 24;;         (* inc ko 24 value diya gya hai aur badle m 25 dega badha k function k karan*)

(* another way to write function by putting arguments left to equal sign*)
let inc x = x + 1;;
inc 45;;

let avg x y = (x +. y) /. 2.;;
avg 3. 5.;;




(* Recursive function:  explicitly mention that function is recursive *)

let rec fact n = 
    if n = 0 then 1
    else n * fact (n - 1);;


fact 5;;



(* Partial application of function *)

let add x y = x + y;;
add 2;;      (* it will return a function that can be used with others. *)
(add 2) 3;;

let add2 = add 2;;
add2 7;;



(* multi-argument functions do not exist in ocaml. there are syntactic sugar of that. 

fun x y -> e 
is syntactic sugar for 
fun x -> (fun x -> e)


let add = fun x -> 
            fun y -> 
                x + y

*)



(* Polymorphic function: it can take arguments of any type*)

let id x = x;;
id 5;;
id "hello";;
id true;;

(* Type variable:  name standing for unknown type.

ocaml syntax: single quote followed by identifier.

ex: 'foo  'key   'value

*)




(* Operators as function *)

( + ) 1 2;;      (* 3 *)
( * ) 2 3;;       (* 6 *)
( = ) 4 5;;       (* compares expressions of same datatype *)
max 3 4;;
(* we can create own operators like this. *)
let ( <^> ) x y = max x y;;         (* yaha pe max se naya infix operator bna diye*)
1 <^> 2;; 


(* Application operators
let @@ f x = f x

reverse application
let ( |> ) x f = f x

aka pipeline
*)

succ;;   (* it gives successive *)
succ 1;;   (* 2 *)
succ (2*10);;   (* 21 *)
succ @@ 3*10;;   (* @@ helps you avoid parenthesis. right to left. *)

let square x = x*x;;
succ (square (square ( succ 5)));;      
5 |> succ |> square |> square |> succ;;     (* reverse application (pipeline operator) use kiya gya hia taki upar wale line ki tarah nested parenthesis lgana n pade... left se ight evaluate karta*)






let rec is_even x =
    if x = 0 then true else is_odd (x - 1)
  and is_odd x =
    if x = 0 then false else is_even (x - 1);;
  
  
  List.map ~f:is_even [0;1;2;3;4;5];;             (* base required *)
  
  List.map ~f:is_odd [0;1;2;3;4;5];;
  




(* Labeled argument *)

let ratio ~num ~denom = Float.of_int num /. Float.of_int denom;;

ratio ~num:3 ~denom:10;;

ratio ~denom:10 ~num:3;;





