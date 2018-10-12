module type MONOID =
sig
  type element
  val zero1 : element
  val zero2 : element
  val mul : element -> element -> element
  val add : element -> element -> element
  val div : element -> element -> element
  val sub : element -> element -> element
end

module FLOAT =
struct
  type element = float
  let zero1 = 0.0
  let zero2 = 1.0
  let add (x:element) (y:element) = x +. y
  let sub (x:element) (y:element) = x -. y
  let mul (x:element) (y:element) = x *. y
  let div (x:element) (y:element) = x /. y
end

module INT =
struct
  type element = int
  let zero1 = 0
  let zero2 = 1
  let add (x:element) (y:element) = x + y
  let sub (x:element) (y:element) = x - y
  let mul (x:element) (y:element) = x * y
  let div (x:element) (y:element) = x / y
end

module type Calc =
  functor (M : MONOID) ->
  sig
    val add : M.element -> M.element -> M.element
    val sub : M.element -> M.element -> M.element
    val mul : M.element -> M.element -> M.element
    val div : M.element -> M.element -> M.element
    val power : M.element -> int -> M.element
    val fact : M.element -> M.element
  end

module Calc =
  functor (M : MONOID) ->
  struct
    let add x y = M.add x y
    let sub x y = M.sub x y
    let mul x y = M.mul x y
    let div x y = M.div x y
    let rec power x n =
      if n <= M.zero1 then M.zero1
      else if n = M.zero2 then x
      else M.mul x (power x (M.sub n M.zero2))
    let rec fact x =
      if x <= M.zero1 then M.zero2
      else M.mul x (fact (M.sub x M.zero2))
  end

module Calc_int = Calc(INT)
module Calc_float = Calc(FLOAT)

let () =
  print_endline "\n*************** INT ***************\n";
  print_string "3 plus 2 = ";
  print_endline (string_of_int (Calc_int.add 3 2));
  print_string "2 plus (10 * 4) = ";
  print_endline (string_of_int (Calc_int.add 2 (Calc_int.mul 10 4)));
  print_string "3 minus 1 = ";
  print_endline (string_of_int (Calc_int.sub 3 1));
  print_string "3 mult 5 = ";
  print_endline (string_of_int (Calc_int.mul 3 5));
  print_string "15 div 3 = ";
  print_endline (string_of_int (Calc_int.div 15 3));
  print_string "3 power 3 = ";
  print_endline (string_of_int (Calc_int.power 3 3));
  print_string "Fact 3 = ";
  print_endline (string_of_int (Calc_int.fact 3));
  print_endline "\n*************** FLOAT ***************\n";
  print_string "3.5 plus 2 = ";
  print_endline (string_of_float (Calc_float.add 3.5 2.0));
  print_string "2.42 plus (10 * 4) = ";
  print_endline (string_of_float (Calc_float.add 2.42 (Calc_float.mul 10.0 4.0)));
  print_string "3 minus 1.2 = ";
  print_endline (string_of_float (Calc_float.sub 3.0 1.2));
  print_string "3 mult 5 = ";
  print_endline (string_of_float (Calc_float.mul 3.0 5.0));
  print_string "15 div 3 = ";
  print_endline (string_of_float (Calc_float.div 15.0 3.0));
  print_string "3 power 3 = ";
  print_endline (string_of_float (Calc_float.power 3.0 3.0));
  print_string "Fact 3 = ";
  print_endline (string_of_float (Calc_float.fact 3.0));

  (* print_endline (string_of_float (Calc_float.power 3.0 3)); *)
  (* print_endline (string_of_int (Calc_int.mul (Calc_int.add 20 1) 2)); *)
  (* print_endline (string_of_float (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0)) *)
