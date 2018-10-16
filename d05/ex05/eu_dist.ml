(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/08 18:12:29 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/08 18:12:30 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let square n = n *. n

let rec calc_sum (index:int) x y =
  if index < (Array.length x) then
    (calc_sum (index + 1) x y) +. (square (x.(index) -. y.(index)))
  else 0.0

let eu_dist x y =
  sqrt (calc_sum 0 x y)

let () =
  Printf.printf "%.1f\n" (eu_dist [|1.0;1.2|] [|1.0;1.2|]);
  Printf.printf "%.1f\n" (eu_dist [|1.0;1.2|] [|1.0;5.2|]);
  Printf.printf "%.1f\n" (eu_dist [|3.0;1.2|] [|1.0;5.2|])
