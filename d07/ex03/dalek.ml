(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/10 17:31:43 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/10 17:31:44 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class dalek =
  object (self)
    initializer print_endline "A Dalek has been created !"
    val _name:string =
      Random.self_init();
      "Dalek"^
      String.uppercase_ascii(String.make 1 (char_of_int((Random.int 25) + 97)))^
      (String.make 1 (char_of_int((Random.int 25) + 97)))^
      (String.make 1 (char_of_int((Random.int 25) + 97)))

    val _hp:int = 100
    val mutable _shield:bool = true

    method to_string =
      "Name = "^_name^
      "\nHP = "^(string_of_int _hp)^
      "\nShield = "^(string_of_bool _shield)

    method get_name = _name
    method get_shield = _shield
    method die = print_endline ("Emergency Temporal Shift!")
    method exterminate (people:People.people) =
      print_endline (people#get_name^" dies !");
      _shield <- false;
      self#die
    method talk =
      let arr = [|
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      |] in
      print_endline arr.(Random.int (Array.length arr))

  end
