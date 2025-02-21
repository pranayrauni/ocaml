(* fold_right folding value of list from right to the left.

Accumulates an answer by: 
  repeatedly applying f to an element of list and "answer so far"
  folding in list elements "from the right"


List.fold_right f [a;b;c] init
computes 
f a ( f b ( f c init ))

*)

let rec fold_right f lst acc = match lst with
  | [] -> acc
  | h :: t -> f h (fold_right f t acc) 


let rec fold_left f acc lst = match lst with
  | [] -> acc
  | h :: t -> fold_left f (f acc h) t


(* fold_left : no work remianing to do after recursive call so it is tail recursive. it requires only constant stack space.

fold_right : It is not tail recursive. There is something remianing to be done after recursive call. It will take linear stack space that is in size of list argument. 

what if i want tail recursive from fold_right. you can get it by reversing the list first then doing a fold from_left. it also depends on [f]. it requires traversing 
  the list in extra time but that doesnot incease asymptotic complexity of algorithm and it gives implementation that does not overflow the stack.

*)