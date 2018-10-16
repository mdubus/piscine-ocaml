(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   army.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/11 10:08:33 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/11 10:08:34 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army (member: 'a list) =
  object
    val _member:'a list = member

    method add m = new army (member @ [m])
    method delete = new army (List.tl _member)
    method print_army = List.iter (function x -> print_endline x#get_name) _member
  end
