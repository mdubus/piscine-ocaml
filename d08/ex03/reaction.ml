(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   reaction.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/12 10:10:04 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/12 10:10:12 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual reaction start result =
  object
    method get_start : (Molecule.molecule * int) list
    method get_result : (Molecules.molecule * int) list
    method balance : reaction
    method is_balanced: bool
  end
