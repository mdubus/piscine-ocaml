(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/02 11:10:40 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/02 13:02:33 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
    let rec fib n prev cur =
        if n < 0 then -1
        else if n = 0 then cur
        else fib (n - 1) (prev + cur) prev
    in fib n 1 0

let main () =
    print_int (fibonacci (-42)) ; print_char '\n';
    print_int (fibonacci 0) ; print_char '\n';
    print_int (fibonacci 1) ; print_char '\n';
    print_int (fibonacci 6) ; print_char '\n';
    print_int (fibonacci 13) ; print_char '\n'

let () = main ()
