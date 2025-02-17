(* record is dtatype built in ocaml. allows to aggregate data together. *)

type student = {
  name : string;
  year : int;
} 


let rbg = {
  name = "rauni";
  year = 2023;
};;

(* rbg.name;; *)
