(* includes allow us to avoid having duplicate codes. Ring and field concept is from abstract algebra. *)

module type Ring = sig
  type t
  val zero : t
  val one : t
  val ( + ) : t -> t -> t
  val ( * ) : t -> t -> t
  val ( ~- ) : t -> t            (* unary nagation *)
  val string : t -> string
end


module IntRingRep = struct 
  type t = int
  let zero = 0
  let one = 1
  let ( + ) = Stdlib.( + )
  let ( * ) = Stdlib.( * )
  let ( ~- ) = Stdlib.( ~- )
  let string = string_of_int
end

module IntRing : Ring = IntRingRep;;


IntRing.zero;;
IntRingRep.zero;;
IntRingRep.(string zero);;     (* string = "0" *)
IntRingRep.( zero + one);;         (* we can add two integers as well *)
IntRingRep.(zero + one |> string);;     (* string = "1" *)


module FloatRingRep = struct
  type t = float
  let zero = 0.
  let one = 1. 
  let ( + ) = Stdlib.( +. )
  let ( * ) = Stdlib.( *. )
  let ( ~- ) = Stdlib.( ~-. )
  let string = string_of_float

end

module FloatRing : Ring = FloatRingRep;;

FloatRingRep.(zero + zero |> string)



(* For the field that includes division we need to write code for field. we can copy from ring then add to field. to tackle code duplication we can use [include] *)


module type Field = sig
  include Ring
  val ( / ) : t -> t -> t
end


module IntFieldRep = struct 
  include IntRingRep
  let ( / ) = Stdlib.( / ) 
end

module IntField : Field = IntFieldRep;;

(* we can do same thing for float field. *)

module FloatFieldRep = struct 
  include FloatRingRep
  let ( / ) = Stdlib.( /. ) 
end

module FloatField : Field = FloatFieldRep;;