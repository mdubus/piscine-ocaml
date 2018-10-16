(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/03 13:45:02 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 18:44:09 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let concat_list l1 l2 =
    let rec concat l1 l2 =
        match l1 with
        | head :: tail -> concat tail (head :: l2)
        | _ -> l2
    in concat l1 l2

let rec print_list_string l =
    match l with
    | head :: tail -> print_string head; print_char ' '; print_list_string tail
    | _ -> ()

let rec print_reverse_string l =
    match l with
    | head :: tail -> print_reverse_string tail; print_string head; print_char ' '
    | _ -> ()

let add c l =
    let rec add_char c l arr =
        match l with
        | head :: tail -> add_char c tail ((c^head) :: arr)
        | _ -> arr
    in add_char c l []

let gray x =
    let rec shade n l1 l2 =
        if n <= 0 then print_char '\n'
        else if n > 1 then
            shade (n - 1) (concat_list (add "0" l1) (add "0" l2)) (concat_list (add "1" l1) (add "1" l2))
        else
            begin
            print_list_string l1;
            print_reverse_string l2;
            print_char '\n';
            end
    in shade x ["0"] ["1"]

let () =
    gray 0;
    gray 1;
    gray 2;
    gray 3;
    gray 4
