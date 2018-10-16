(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   doctor.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/10 15:55:11 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/10 15:55:12 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor ?(hp=100) name age sidekick =
  object (self)
    initializer print_endline "A Doctor has been created !"
    val _name:string = name
    val _hp:int = hp
    val _age:int = age
    val _sidekick:People.people = sidekick

    method to_string = "Doctor name = "^_name^"\nHP = "^(string_of_int _hp)
                       ^"\nAge = "^(string_of_int _age)
                       ^"\n\nSidekick : \n"^(_sidekick#to_string)
    method get_name = _name
    method talk = print_endline ("Hi! I’m the Doctor!")
    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
    method private regenerate = new doctor _name _age _sidekick
    method make_regeneration = self#regenerate
    method travel_in_time (start:int) (arrival:int) =
      print_endline "              ___
      _______(_@_)_______
      | POLICE      BOX |
      |_________________|
       | _____ | _____ |
       | |###| | |###| |
       | |###| | |###| |
       | _____ | _____ |
       | || || | || || |
       | ||_|| | ||_|| |
       | _____ |$_____ |
       | || || | || || |
       | ||_|| | ||_|| |
       | _____ | _____ |
       | || || | || || |
       | ||_|| | ||_|| |
       |       |       |
       *****************"
  end
