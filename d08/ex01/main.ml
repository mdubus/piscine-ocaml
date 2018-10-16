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
  let water = new Molecules.water
  and trinitrotoluene = new Molecules.trinitrotoluene
  and carbon_dioxyde = new Molecules.carbon_dioxyde
  and hydrochloric_acid = new Molecules.hydrochloric_acid
  and nitroglycerin = new Molecules.nitroglycerin
  and ascorbic_acid = new Molecules.ascorbic_acid
  and amoniac = new Molecules.amoniac in
  print_endline "\n ************ MOLECULES ************";
  print_endline water#to_string;
  print_endline trinitrotoluene#to_string;
  print_endline amoniac#to_string;
  print_endline carbon_dioxyde#to_string;
  print_endline hydrochloric_acid#to_string;
  print_endline nitroglycerin#to_string;
  print_endline ascorbic_acid#to_string;
  print_endline "\n ************ Is Water Amoniac ? ************\n";
  print_endline (string_of_bool (water#equals amoniac));
  print_endline "\n ************ Is Water Water ? ************\n";
  print_endline (string_of_bool (water#equals water));
