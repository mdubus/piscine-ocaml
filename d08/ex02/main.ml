(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/11 13:51:25 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/11 13:51:26 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let methane = new Alkane.methane
  and ethane = new Alkane.ethane
  and propane = new Alkane.propane
  and butane = new Alkane.butane
  and pentane = new Alkane.pentane
  and hexane = new Alkane.hexane
  and heptane = new Alkane.heptane
  and octane = new Alkane.octane
  and nonane = new Alkane.nonane
  and decane = new Alkane.decane
  and undecane = new Alkane.undecane
  and dodecane = new Alkane.dodecane in

  print_endline "\n ************ ALKANES ************\n";
  print_endline methane#to_string;
  print_endline ethane#to_string;
  print_endline propane#to_string;
  print_endline butane#to_string;
  print_endline pentane#to_string;
  print_endline hexane#to_string;
  print_endline heptane#to_string;
  print_endline octane#to_string;
  print_endline nonane#to_string;
  print_endline decane#to_string;
  print_endline undecane#to_string;
  print_endline dodecane#to_string;
  print_endline "\n ************ Is Methane Ethane ? ************\n";
  print_endline (string_of_bool (methane#equals ethane));
  print_endline "\n ************ Is Methane Methane ? ************\n";
  print_endline (string_of_bool (methane#equals methane));
