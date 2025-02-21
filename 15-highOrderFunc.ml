(* 

Functions are values
  can use them anywhere we use values
  function can take function as arguments
  function can return function as result
  .... so functions are high order functions

*)

let double x = 2 * x;;

let square x = x * x;;

let quad x = 4 * x;;

let quad' x = double (double x);;

let quad'' x = x |> double |> double;;

let fourth x = x * x * x * x;;

let fourth' x = square (square x);;

let fourth'' x = x |> square |> square;;

(* Above we are seeing repeated code.  *)

let twice f x = f (f x);;

let quad''' x = twice double x;;

let fourth''' x =  twice square x;;

let twice f x = x |> f |> f;;

let quad'''' = twice double;; 

let fourth'''' = twice square;;
