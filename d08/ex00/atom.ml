(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/11 13:22:46 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/11 13:22:47 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom name symbol atomic_number =
  object (self)
    val _name : string = name
    val _symbol : string = symbol
    val _atomic_number : int = atomic_number

    method get_name = _name
    method get_symbol = _symbol
    method get_atomic_number = _atomic_number

    method to_string = "name: "^_name^
                               "\nsymbol: "^_symbol^
                               "\natomic_number: "^(string_of_int _atomic_number)

    method equals (that:atom) = (self#get_name = that#get_name) &&
                                (self#get_symbol = that#get_symbol) &&
                                (self#get_atomic_number = that#get_atomic_number)

  end

class hydrogen =
  object
    inherit atom "Hydrogen" "H" 1
  end

class helium =
  object
    inherit atom "Helium" "He" 2
  end

class lithium =
  object
    inherit atom "Lithium" "Li" 3
  end

class carbon =
  object
    inherit atom "Carbon" "C" 6
  end

class nitrogen =
  object
    inherit atom "Nitrogen" "N" 7
  end

class oxygen =
  object
    inherit atom "Oxygen" "O" 8
  end

class calcium =
  object
    inherit atom "Calcium" "Ca" 20
  end

class arsenic =
  object
    inherit atom "Arsenic" "As" 33
  end

class krypton =
  object
    inherit atom "Krypton" "Kr" 36
  end

class silver =
  object
    inherit atom "Silver" "Ag" 47
  end

class gold =
  object
    inherit atom "Gold" "Au" 79
  end
