(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/10 15:19:34 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/10 15:19:35 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let person = new People.people "Morgane" ~hp:42 in
  print_endline person#to_string;
  person#talk;
  person#die
