(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/03 12:04:50 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/04 21:59:05 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec print_list_string l =
    match l with
    | head :: tail -> print_string head; print_list_string tail
    | _ -> print_char '\n'

let rec is_in_list elem l =
    match l with
    | head :: tail when head = elem -> true
    | head :: tail when head != elem -> is_in_list elem tail
    | _ -> false

let crossover l1 l2 =
    let rec search l1 l2 arr =
    match l1 with
    | head :: tail when is_in_list head l2 = true && is_in_list head arr = false -> search tail l2 (arr @ [head])
    | head :: tail when is_in_list head l2 = true && is_in_list head arr = true -> search tail l2 arr
    | head :: tail when is_in_list head l2 = false -> search tail l2 arr
    | _ -> arr
    in search l1 l2 []

let () =
    print_list_string (crossover ["a"] ["a"]);
    print_list_string (crossover ["a"] ["a"; "b"]);
    print_list_string (crossover ["a"] ["a"; "b"; "a"]);
    print_list_string (crossover ["a"; "b"] ["a"]);
    print_list_string (crossover ["a"; "b"] ["a"; "b"]);
    print_list_string (crossover ["a"; "b"] ["a"; "b"; "a"]);
    print_list_string (crossover ["a"; "b"; "a"] ["a"]);
    print_list_string (crossover ["a"; "b"; "a"] ["a"; "b"]);
    print_list_string (crossover ["a"; "b"; "a"] ["a"; "b"; "a"]);
    print_list_string (crossover ["a"; "b"; "a"] []);
    print_list_string (crossover [] ["a"; "b"; "a"]);
    print_list_string (crossover [] []);
    print_list_string (crossover ["a"; "b"; "a" ; "c"] ["a" ; "c"])
