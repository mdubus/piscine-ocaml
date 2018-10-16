(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/10 15:18:18 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/10 15:18:20 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people ?(hp=100) name =
  object
    initializer print_endline "A new Person has been created !"
    val _name:string = name
    val _hp:int = hp

    method to_string = "Person name = "^_name^"\nHP =  "^(string_of_int _hp)
    method talk = print_endline ("I'm "^_name^"! Do you know the Doctor ?")
    method die = print_endline "Aaaarghh!"
  end
