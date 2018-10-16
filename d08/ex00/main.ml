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
  let hydrogen = new Atom.hydrogen
  and helium = new Atom.helium
  and lithium = new Atom.lithium
  and carbon = new Atom.carbon
  and nitrogen = new Atom.nitrogen
  and oxygen = new Atom.oxygen
  and calcium = new Atom.calcium
  and arsenic = new Atom.arsenic
  and krypton = new Atom.krypton
  and silver = new Atom.silver
  and gold = new Atom.gold in
  print_endline "\n ************ HYDROGEN ************\n";
  print_endline hydrogen#to_string;
  print_endline "\n ************ HELIUM ************\n";
  print_endline helium#to_string;
  print_endline "\n ************ LITHIUM ************\n";
  print_endline lithium#to_string;
  print_endline "\n ************ CARBON ************\n";
  print_endline carbon#to_string;
  print_endline "\n ************ NITROGEN ************\n";
  print_endline nitrogen#to_string;
  print_endline "\n ************ OXYGEN ************\n";
  print_endline oxygen#to_string;
  print_endline "\n ************ CALCIUM ************\n";
  print_endline calcium#to_string;
  print_endline "\n ************ ARSENIC ************\n";
  print_endline arsenic#to_string;
  print_endline "\n ************ KRYPTON ************\n";
  print_endline krypton#to_string;
  print_endline "\n ************ SILVER ************\n";
  print_endline silver#to_string;
  print_endline "\n ************ GOLD ************\n";
  print_endline gold#to_string;

  print_endline "\n ************ Is Hydrogen Hydrogen ? ************\n";
  print_endline (string_of_bool (hydrogen#equals hydrogen));
  print_endline "\n ************ Is Hydrogen Carbon ? ************\n";
  print_endline (string_of_bool (hydrogen#equals carbon));
  print_endline "\n ************ Is Hydrogen oxygen ? ************\n";
  print_endline (string_of_bool (hydrogen#equals oxygen))
