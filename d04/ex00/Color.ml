(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Color.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/05 13:20:07 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 13:55:44 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(*
 * Diamond : Losange
 * Club : Trefle
 * Heart : Coeur
 * Spade : Pique
*)

type t = Spade | Heart | Diamond | Club

let all = [Spade; Heart; Diamond; Club ]

let toString t =
    match t with
    | Spade -> "S"
    | Heart -> "H"
    | Diamond -> "D"
    | Club -> "C"

let toStringVerbose t =
    match t with
    | Spade -> "Spade"
    | Heart -> "Heart"
    | Diamond -> "Diamond"
    | Club -> "Club"
