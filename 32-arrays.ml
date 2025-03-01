let numbers = [| 1; 2; 3; 4; 5 |];;
numbers;;
numbers.(2) <- 10;;   (* The .(i) syntax is used to refer to an element of an array, and the <- syntax is for modification. *)
numbers;;