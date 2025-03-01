(* #require "base";; *)
open Base;;

let long_string s = String.length s > 6;;

let long_string s = String.length s;;          (* string length calculation *)


long_string "hihdhdjjaj"


let a_tuple = (3,"three");;
let (x,y) = a_tuple;;

(* exponential power  *)
(* let distance (x1,y1) (x2,y2) = *)
  (* Float.sqrt ((x1 -. x2) ** 2. +. (y1 -. y2) ** 2.);; *)


  let downcase_extension filename =
    match String.rsplit2 filename ~on:'.' with
    | None -> filename
    | Some (base,ext) ->
      base ^ "." ^ String.lowercase_ascii ext;;

