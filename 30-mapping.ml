(* map module in ocaml uses balanced binary tree for backend implementation. 
map module has functor in it called [make] which makes a map data structure based on input which is itself a structure. 
To create a map you have to pass into make functor a module, that has two things in it type for keys and comparision functions for keys. 
The resaon map module needs a comparision function is because of that balanced binary tree implementation. It nedds to be able to compare keys that exist at each node in tree.


*)

type day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

let int_of_day = function
    | Mon -> 1
    | Tue -> 2
    | Wed -> 3
    | Thu -> 4
    | Fri -> 5
    | Sat -> 6
    | Sun -> 7 

(* I want ot create a map whose key are days then I need to create amodule that soecifies what a key type is and how to compare them.  *)

module DayKey = struct
  type t = day
  let compare day1 day2 =
  int_of_day day1 - int_of_day day2
end

(* now create data structure for mapping days to whatever I want *)

module DayMap = Map.Make(DayKey)

(* DayMap now must have keys that have days but it allowed to map those keys to whatever type of values I want *)

let m = 
    let open DayMap in
    empty
    |> add Mon "Monday"
    |> add Tue "Tuesday";;              (* here keys are being matched to string *)



m;;
open DayMap;;
mem Mon m;;
find Mon m;;
bindings m;;   (* binding function is from map module. It gives list of pairs(first element is key and 2nd is value). This is known as association list. *)