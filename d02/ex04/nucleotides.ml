(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/03 19:48:23 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/04 22:11:31 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase =
    | A
    | T
    | C
    | G
    | None

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

