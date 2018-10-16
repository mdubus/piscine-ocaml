(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/03 09:48:10 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/04 21:39:55 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let print_tuple (a, b) =
    print_int a ; print_string b

let rec print_list_tuples l =
    match l with
    | head :: tail -> print_tuple head ; print_list_tuples tail
    | _ -> print_char '\n'

let encode l =
    let rec store n l arr =
    match l with
    | head :: next :: tail when head = next -> store (n + 1) (next :: tail) arr
    | head :: next :: tail when head != next -> store 1 (next :: tail) (arr @ [(n, head)])
    | head :: [] -> store 1 [] (arr @ [(n, head)])
    | _ -> arr
    in store 1 l []

let () =
    print_list_tuples(encode ["a"]);
    print_list_tuples(encode ["a"; "b"]);
    print_list_tuples(encode ["a"; "a"; "a"; "b"]);
    print_list_tuples(encode ["a"; "a"; "b"; "b"]);
    print_list_tuples(encode ["a"; "b"; "b"; "b"]);
    print_list_tuples(encode ["b"; "b"; "b"; "b"]);
    print_list_tuples(encode ["a"; "a"; "b"; "b"; "a" ; "a"]);
    print_list_tuples(encode ["Toto"; "Toto"; "Tata"]);
    print_list_tuples(encode [])
