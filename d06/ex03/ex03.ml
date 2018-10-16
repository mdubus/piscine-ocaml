(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex03.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/09 16:55:51 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/09 16:55:55 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type FIXED = sig
  type t
  val of_float: float -> t
  val of_int: int -> t
  val to_float :t -> float
  val to_int :t -> int
  val to_string: t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t

  val add :t->t->t
  (*
            val min :t->t->t
            val max :t->t->t
            val gth :t->t->bool
            val lth :t->t->bool
            val gte :t->t->bool
            val lte :t->t->bool
            val eqp : t -> t -> bool
            val eqs : t -> t -> bool
            val sub :t->t->t
            val mul :t->t->t
            val div :t->t->t
            val foreach : t -> t -> (t -> unit) -> unit *)
end


module type FRACTIONNAL_BITS =
sig
  val bits: int
end

(* Functor signature *)
module type MAKE =
  functor (FractionnalBits:FRACTIONNAL_BITS) -> FIXED

(* Functor *)
module Make:MAKE =
  functor (FractionnalBits:FRACTIONNAL_BITS) ->
  struct
    type t = int

    let of_float n = int_of_float (ceil (n *. float_of_int (1 lsl FractionnalBits.bits)))
    let of_int n = n lsl FractionnalBits.bits
    let to_float n = ((float_of_int n) /. float_of_int(1 lsl FractionnalBits.bits))
    let to_int n = n lsr FractionnalBits.bits
    let to_string n = string_of_float (to_float n)

    let zero = of_int 0
    let one = of_int 1
    let succ n = n + one
    let pred n = n - one

    let add x y = x + y
  end

module Fixed4 : FIXED =
  Make (
  struct
    let bits = 4
  end
  )

module Fixed8 : FIXED =
  Make (
  struct
    let bits = 8
  end
  )


let () =
  let fx8 = Fixed8.of_float 21.10 in
  let fy8 = Fixed8.of_float 21.32 in
  let fr8 = Fixed8.add fx8 fy8 in

  let ix8 = Fixed8.of_int 21 in
  let iy8 = Fixed8.of_int 21 in
  let ir8 = Fixed8.add ix8 iy8 in

  let fx4 = Fixed4.of_float 21.10 in
  let fy4 = Fixed4.of_float 21.32 in
  let fr4 = Fixed4.add fx4 fy4 in

  let ix4 = Fixed4.of_int 21 in
  let iy4 = Fixed4.of_int 21 in
  let ir4 = Fixed4.add ix4 iy4 in
  (* print_int fx8 *)
  print_endline "******************** FIXED 8 ********************";
  print_endline "To string of floats : ";
  print_endline (Fixed8.to_string fr8);
  print_endline "\nTo string of ints : ";
  print_endline (Fixed8.to_string ir8);
  print_endline "\nTo string of zero : ";
  print_endline (Fixed8.to_string Fixed8.zero);
  print_endline "\nTo string of one : ";
  print_endline (Fixed8.to_string Fixed8.one);
  print_endline "\nTo string of succ of 42 : ";
  print_endline (Fixed8.to_string (Fixed8.succ ix8));
  print_endline "\nTo string of pred of 42 : ";
  print_endline (Fixed8.to_string (Fixed8.pred ix8));

  print_endline "******************** FIXED 4 ********************";
  print_endline "To string of floats : ";
  print_endline (Fixed4.to_string fr4);
  print_endline "\nTo string of ints : ";
  print_endline (Fixed4.to_string ir4);
  print_endline "\nTo string of zero : ";
  print_endline (Fixed4.to_string Fixed4.zero);
  print_endline "\nTo string of one : ";
  print_endline (Fixed4.to_string Fixed4.one);
  print_endline "\nTo string of succ of 42 : ";
  print_endline (Fixed4.to_string (Fixed4.succ ix4));
  print_endline "\nTo string of pred of 42 : ";
  print_endline (Fixed4.to_string (Fixed4.pred ix4))
  (* Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f)) *)
  (* print_float Fixed4.zero *)
