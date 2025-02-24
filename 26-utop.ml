(* When working with modules there are a few subtleties about utop. 

When we use #use then we are issuing commands from that file into utop.

ocamlbuild stack.cmo stack.cmi
command to build files build directory using utop. 
dot cmi compiled version of mli file and cmo is compiled version of ml file


If we want a command to run everytime we launch utop then put those commands in dot ocamlinit file.

when we want to load code from third-party library then use ounit2
require "ounit2";;
OUnit2.assert_equal;;

*)