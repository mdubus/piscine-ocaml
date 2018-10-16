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
  let morgane = new People.people "Morgane" in
  let dalek = new Dalek.dalek in
  let doctor = new Doctor.doctor "Doctor Who" 42 morgane in
  print_endline "\n ************ CHARACTERS ************\n";
  print_endline dalek#to_string; print_char '\n';
  print_endline doctor#to_string; print_char '\n';
  print_endline "\n ************ PRESENTATIONS ************\n";
  print_endline "Morgane : ";
  morgane#talk;
  print_endline "\nDoctor Who : ";
  doctor#talk;
  print_endline "\nDalek : ";
  dalek#talk;
  print_endline "\n ************ A CHARACTER DIES ! ************\n";
  morgane#die;
  dalek#exterminate morgane;
  print_string "Dalek's shield value is now : ";
  print_endline(string_of_bool dalek#get_shield);
  dalek#talk;
  print_endline "\n ************ DOCTOR CHOOSE TO ESCAPE ! ************\n";
  doctor#travel_in_time 2018 2050;
  print_endline "\n ************ DALEK WINS ! ************\n"
