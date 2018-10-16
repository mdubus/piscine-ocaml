(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tak.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/02 10:40:48 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/02 11:09:01 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec tak x y z =
    if y >= x then z
    else tak (tak (x - 1) y z) (tak (y - 1) z x) (tak (z - 1) x y)

let main () =
    print_int (tak 1 2 3) ; print_char '\n';
    print_int (tak 5 23 7) ; print_char '\n';
    print_int (tak 9 1 0) ; print_char '\n';
    print_int (tak 1 1 1) ; print_char '\n';
    print_int (tak 0 42 0) ; print_char '\n';
    print_int (tak 23498 98734 98776) ; print_char '\n';
    print_int (tak (-1) 1 1) ; print_char '\n';
    print_int (tak 1 (-1) 1) ; print_char '\n';
    print_int (tak 1 1 (-1)) ; print_char '\n';
    print_int (tak 0 1 1) ; print_char '\n';
    print_int (tak 1 0 1) ; print_char '\n';
    print_int (tak 1 1 0) ; print_char '\n'

let () = main ()
