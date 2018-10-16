(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/02 13:11:18 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/02 13:41:51 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter f start n =
    if n < 0 then -1
    else if n = 0 then start
    else iter f (f start) (n - 1)

let main () =
    print_int (iter (fun x -> x * x) 4 (-1)) ; print_char '\n';
    print_int (iter (fun x -> x * x) 4 0) ; print_char '\n';
    print_int (iter (fun x -> x * x) 4 1) ; print_char '\n';
    print_int (iter (fun x -> x * x) 4 2) ; print_char '\n';
    print_int (iter (fun x -> x * x) (-1) 4) ; print_char '\n';
    print_int (iter (fun x -> x * x) 0 4) ; print_char '\n';
    print_int (iter (fun x -> x * x) 1 4) ; print_char '\n';
    print_int (iter (fun x -> x * x) 2 4) ; print_char '\n'

let () = main ()
