(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/11 18:17:51 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/11 18:17:52 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


class virtual alkane n =
  object (self)
    val _n : int = n

    method get_name =
      match _n with
      | 1 ->"Methane"
      | 2 ->"Ethane"
      | 3 ->"Propane"
      | 4 ->"Butane"
      | 5 ->"Pentane"
      | 6 ->"Hexane"
      | 7 ->"Heptane"
      | 8 ->"Octane"
      | 9 ->"Nonane"
      | 10 ->"Decane"
      | 11 ->"Undecane"
      | 12 ->"Dodecane"
      | _ -> "Unknown Alkane"

    method get_formula =
      "C"^
      (if n > 1 then (string_of_int _n) else "")^
      "H"^(string_of_int(2 * n + 2))

    method to_string = "name: "^self#get_name^
                       "\nformula: "^self#get_formula

    method equals (that:alkane) = (self#get_name = that#get_name) &&
                                (self#get_formula = that#get_formula)

  end

class methane =
  object
    inherit alkane 1
  end

class ethane =
  object
    inherit alkane 2
  end

class propane =
  object
    inherit alkane 3
  end

class butane =
  object
    inherit alkane 4
  end

class pentane =
  object
    inherit alkane 5
  end

class hexane =
  object
    inherit alkane 6
  end

class heptane =
  object
    inherit alkane 7
  end

class octane =
  object
    inherit alkane 8
  end

class nonane =
  object
    inherit alkane 9
  end

class decane =
  object
    inherit alkane 10
  end

class undecane =
  object
    inherit alkane 11
  end

class dodecane =
  object
    inherit alkane 12
  end
