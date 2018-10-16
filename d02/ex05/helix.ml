(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/03 19:48:23 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/03 21:46:52 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase =
    | A | T | C | G | None

type nucleotide = {
    phosphate: phosphate;
    deoxyribose: deoxyribose;
    nucleobase: nucleobase
}

let generate_nucleotide t = {
    phosphate = "phosphate";
    deoxyribose = "deoxyribose";
    nucleobase = match t with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _ -> None
}

type helix = nucleotide list

let get_random_nucleotide () =
    let rand =
        begin
            Random.self_init ();
            Random.int 4
        end in
    match rand with
    | 0 -> generate_nucleotide 'A'
    | 1 -> generate_nucleotide 'T'
    | 2 -> generate_nucleotide 'C'
    | 3 -> generate_nucleotide 'G'
    | _ -> generate_nucleotide ' '

let generate_helix n =
    let empty_helix:helix = [] in
    let rec generate m helix =
        if m > 0 then generate (m - 1) (get_random_nucleotide () :: helix)
        else helix
    in generate n empty_helix

let get_nucleobase_string nucleo =
    match nucleo with
    | A -> "A"
    | T -> "T"
    | C -> "C"
    | G -> "G"
    | _ -> " "

let concat_nucleobase helix =
    let rec concat helix s =
        match helix with
        | head :: tail -> concat tail ((get_nucleobase_string head.nucleobase)^s)
        | _ -> s
    in concat helix ""

let get_matching_helix nucleo =
    match nucleo with
    | A -> generate_nucleotide 'T'
    | T -> generate_nucleotide 'A'
    | C -> generate_nucleotide 'G'
    | G -> generate_nucleotide 'C'
    | _ -> generate_nucleotide ' '

let complementary_helix helix =
    let empty_helix:helix = [] in
    let rec match_helix helix new_helix =
         match helix with
        | head :: tail -> match_helix (tail) (new_helix @ [get_matching_helix (head.nucleobase)])
        | _ -> new_helix
    in match_helix helix empty_helix

let () =
    let helix = generate_helix 10 in
    print_endline (concat_nucleobase helix);
    print_endline (concat_nucleobase (complementary_helix helix))
