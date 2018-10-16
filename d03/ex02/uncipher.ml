(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   uncipher.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/04 19:18:14 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 09:57:39 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let unrotchar x n =
    let res = (int_of_char x) - n in
    if (x >= 'a' && x <= 'z') then
        if res < int_of_char 'a' then char_of_int(res + 26)
        else char_of_int res
    else if (x >= 'A' && x <= 'Z') then
        if res < int_of_char 'A' then char_of_int(res + 26)
        else char_of_int res
    else x

let unrot42 s =
    String.map (function x -> unrotchar x (42 mod 26)) s

let uncaesar n s =
    String.map (function x -> unrotchar x (n mod 26)) s

let rec ft_uncrypt s l:string =
    match l with
    | head :: tail -> ft_uncrypt (head s) tail
    | [] -> s

let main () =
    print_endline "\nunrot42 'seksek' : ";
    print_endline (unrot42 "seksek");
    print_endline "\nuncaesar 42 'seksek' : ";
    print_endline (uncaesar 42 "seksek");
    print_endline "\nuncrypt 'YU_YU_' : ";
    print_endline (ft_uncrypt "YU_YU_" [uncaesar 42; Cipher.xor 42]);
    print_endline "\nuncrypt 'QNOTUR' : ";
    print_endline (ft_uncrypt "QNOTUR" [unrot42; uncaesar 42; Cipher.xor 42])

let () = main ()
