(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/10 15:57:37 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/10 15:57:38 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  print_endline "\n ************ INITIALIZATION ! ************\n";
  let sidekick = new People.people ~hp:10 "Mathilde" in
  let doc = new Doctor.doctor ~hp:42 "Morgane" 42 sidekick in
  print_endline "\n ************ CHARACTERS ************";
  print_endline doc#to_string;
  print_endline "\n ************ REGENERATE ! ************\n";
  print_endline doc#make_regeneration#to_string;
  print_endline "\n ************ TALK ! ************\n";
  doc#talk;
  print_endline "\n ************ SONIC SCREWDRIVER ! ************\n";
  doc#use_sonic_screwdriver;
  print_endline "\n ************ TRAVEL IN TIME ! ************\n";
  doc#travel_in_time 2018 2050
