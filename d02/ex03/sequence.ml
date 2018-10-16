(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/03 17:48:37 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 18:46:21 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let encode l =
    let rec store n l arr =
        match l with
        | head :: next :: tail when head = next -> store (n + 1) (next :: tail) arr
        | head :: next :: tail when head != next -> store 1 (next :: tail) (arr @ [head] @ [(string_of_int n)])
        | head :: [] -> store 1 [] (arr @ [head] @ [(string_of_int n)])
        | _ -> arr
    in store 1 l []


let rec make_string l s =
    match l with
    | head :: tail -> make_string tail head^s
    | _ -> s

let sequence n =
    if n > 0 then
        begin
    let rec loop m arr  =
        if m > 1 then loop (m - 1) (encode arr)
        else arr
    in make_string (loop n ["1"]) ""
    end
    else ""

let () =
    print_endline (sequence (-1));
    print_endline (sequence 0);
    print_endline (sequence 1);
    print_endline (sequence 2);
    print_endline (sequence 3);
    print_endline (sequence 4);
    print_endline (sequence 5);
    print_endline (sequence 6);
    print_endline (sequence 7)
