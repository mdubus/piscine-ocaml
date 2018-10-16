(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/11 14:12:41 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/11 14:12:42 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(********** Sort atoms **********)

let get_sorted_atoms _atoms =
  let new_atoms = List.map (function x -> x#get_symbol) _atoms in
  let carbon = List.filter (function x -> x = "C") new_atoms
  and hydrogen = List.filter (function x -> x = "H") new_atoms
  and rest = List.filter (function x ->
      x <> "C" &&
      x <> "H") new_atoms

  in let sorted_rest = List.sort compare rest
  in carbon@hydrogen@sorted_rest

(********** Count atoms **********)

let count_atoms atoms =
  let rec store n l s =
    match l with
    | head :: next :: tail when head = next -> store (n + 1) (next :: tail) s
    | head :: next :: tail when head != next -> store 1 (next :: tail) (s^head^(if n > 1 then (string_of_int n) else ""))
    | head :: [] -> store 1 [] (s^head^(if n > 1 then (string_of_int n) else ""))
    | _ -> s
  in store 1 (get_sorted_atoms atoms) ""

(********** Molecules Class **********)

class virtual molecule name (atoms : Atom.atom list) =
  object (self)
    val _name : string = name
    val _atoms: Atom.atom list = atoms

    method get_name = _name
    method formula: string = count_atoms _atoms
    method to_string = "\nName : "^_name^"\nFormula : "^self#formula
    method equals (that:molecule) = (self#get_name = that#get_name) && (self#formula = that#formula)

  end

class water =
  object
    inherit molecule "Water" [new Atom.oxygen; new Atom.hydrogen;new Atom.hydrogen]
  end

class carbon_dioxyde =
  object
    inherit molecule "Carbon Dioxyde" [
        new Atom.oxygen;new Atom.carbon;new Atom.oxygen]
  end

class trinitrotoluene =
  object
    inherit molecule "Trinitrotoluene (TNT)" [
        new Atom.nitrogen; new Atom.nitrogen;new Atom.nitrogen;
        new Atom.hydrogen;new Atom.hydrogen;new Atom.hydrogen;
        new Atom.hydrogen;new Atom.hydrogen;
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen;
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen;
        new Atom.carbon;new Atom.carbon;new Atom.carbon;
        new Atom.carbon;new Atom.carbon;new Atom.carbon;
        new Atom.carbon
      ]
  end

class amoniac =
  object
    inherit molecule "Amoniac" [
        new Atom.hydrogen; new Atom.hydrogen;new Atom.hydrogen;
        new Atom.nitrogen]
  end

class hydrochloric_acid =
  object
    inherit molecule "Hydrochloric Acid" [
        new Atom.hydrogen; new Atom.chlorine]
  end

class ascorbic_acid =
  object
    inherit molecule "Ascorbic Acid (Vitamin C)" [
        new Atom.carbon;new Atom.carbon;new Atom.carbon;
        new Atom.carbon;new Atom.carbon;new Atom.carbon;
        new Atom.hydrogen;new Atom.hydrogen;new Atom.hydrogen;
        new Atom.hydrogen;new Atom.hydrogen;new Atom.hydrogen;
        new Atom.hydrogen;new Atom.hydrogen;
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen;
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen
      ]
  end

class nitroglycerin =
  object
    inherit molecule "Nitroglycerin" [
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen;
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen;
        new Atom.oxygen;new Atom.oxygen;new Atom.oxygen;
        new Atom.hydrogen;new Atom.hydrogen;new Atom.hydrogen;
        new Atom.hydrogen;new Atom.hydrogen;
        new Atom.carbon; new Atom.carbon; new Atom.carbon;
        new Atom.nitrogen;new Atom.nitrogen;new Atom.nitrogen
      ]
  end
