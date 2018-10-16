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
  print_endline "\n ************ DALEK INITIALIZATION ! ************\n";
  let dalek_army = new Army.army [new Dalek.dalek;new Dalek.dalek;new Dalek.dalek] in
  print_endline "\n ************ Dalek Army created ! ************\n";
  dalek_army#print_army;
  print_endline "\n ************ A new Dalek join the army ! ************\n";
  let bigger_dalek_army = dalek_army#add (new Dalek.dalek) in
  bigger_dalek_army#print_army;
  print_endline "\n ************ The first Dalek of the army dies :( ************\n";
  let smaller_dalek_army = bigger_dalek_army#delete in
  smaller_dalek_army#print_army;

  print_endline "\n ************ DOCTOR INITIALIZATION ! ************\n";
  let doctor_army = new Army.army [
    new Doctor.doctor "Doctor Who ? Doctor 1 !" 1 (new People.people "Morgane");
    new Doctor.doctor "Doctor Who ? Doctor 2 !" 2 (new People.people "Morgane");
    new Doctor.doctor "Doctor Who ? Doctor 3 !" 3 (new People.people "Morgane");
  ] in
  print_endline "\n ************ Doctor Army created ! ************\n";
  doctor_army#print_army;
  print_endline "\n ************ A new Doctor join the army ! ************\n";
  let bigger_doctor_army = doctor_army#add (new Doctor.doctor "Doctor Who ? Doctor 4 !" 4 (new People.people "Morgane")) in
  bigger_doctor_army#print_army;
  print_endline "\n ************ The first Doctor of the army dies :( ************\n";
  let smaller_doctor_army = bigger_doctor_army#delete in
  smaller_doctor_army#print_army;

  print_endline "\n ************ PEOPLE INITIALIZATION ! ************\n";
  let people_army = new Army.army [
    new People.people "People 1";new People.people "People 2";new People.people "People 3"] in
  print_endline "\n ************ People Army created ! ************\n";
  people_army#print_army;
  print_endline "\n ************ A new People join the army ! ************\n";
  let bigger_people_army = people_army#add (new People.people "People 4") in
  bigger_people_army#print_army;
  print_endline "\n ************ The first People of the army dies :( ************\n";
  let smaller_people_army = bigger_people_army#delete in
  smaller_people_army#print_army;
