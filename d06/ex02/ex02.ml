(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex02.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/09 14:42:38 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/09 14:42:40 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


module type PAIR =
sig
  val pair : (int * int)
end

module type VAL =
sig
  val x : int
end

(* FIX ME !!! *)

module type MAKEPROJECTION =
  functor (Pair:PAIR) -> VAL

module MakeFst:MAKEPROJECTION =
  functor (Pair:PAIR) ->
  struct
    let x = fst Pair.pair
  end

module MakeSnd:MAKEPROJECTION =
  functor (Pair:PAIR) ->
  struct
    let x = snd Pair.pair
  end

module Pair : PAIR =
struct
  let pair = ( 21, 42 )
end

module Fst : VAL = MakeFst (Pair)
module Snd : VAL = MakeSnd (Pair)

let () =
  Printf.printf "Fst.x = %d, Snd.x = %d\n" Fst.x Snd.x
