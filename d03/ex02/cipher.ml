(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   cipher.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/04 19:18:06 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 09:57:56 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rotchar x n =
    let res = (int_of_char x) + n in
    if (x >= 'a' && x <= 'z') then
        if res > int_of_char 'z' then char_of_int(res - 26)
        else char_of_int res
    else if (x >= 'A' && x <= 'Z') then
        if res > int_of_char 'Z' then char_of_int(res - 26)
        else char_of_int res
    else x

let rot42 s =
    String.map (function x -> rotchar x (42 mod 26)) s

let caesar n s =
    String.map (function x -> rotchar x (n mod 26)) s

let xor n s =
    String.map (function x -> char_of_int ((int_of_char x) lxor n)) s

let rec ft_crypt s l:string =
    match l with
    | head :: tail -> ft_crypt (head s) tail
    | [] -> s

let main () =
    print_endline "rot42 'coucou' : ";
    print_endline (rot42 "coucou");
    print_endline "\ncaesar 42 'coucou' : ";
    print_endline (caesar 42 "coucou");
    print_endline "\nxor 32 'coucou' : ";
    print_endline (xor 32 "coucou");
    print_endline "\ncrypt 'coucou' : ";
    print_endline (ft_crypt "coucou" [xor 42; caesar 42]);
    print_endline "\ncrypt 'abcdef' : ";
    print_endline (ft_crypt "abcdef" [xor 42; caesar 42; rot42])

let () = main ()
