module M = struct
  let x = 0
end

module N = struct
  include M                        (* module M ends with two values. [include] including all definitions from module M inside N. *)
  let y = x + 1
end

module O = struct
  open M                    (* here module M ends with one value. Here we donot [include] M. we just [open] it into scope to make it names available for use internally *)
  let y = x + 1
end

(* [open] M

- imports definition from M
- makes them available for local consumption
- does not expose them to outside world


[include] M

- imports definition from M
- makes them available for local consumption
- exports them to outside world


*)