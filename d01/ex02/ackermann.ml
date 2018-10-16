(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/02 10:21:09 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/02 10:37:40 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ackermann m n =
    if m < 0 || n < 0 then -1
    else if m = 0 then n + 1
    else
        begin
            if n = 0 then ackermann (m - 1) 1
            else ackermann (m - 1) (ackermann m (n - 1))
        end

let main () =
    print_int (ackermann (-1) 7); print_char '\n';
    print_int (ackermann 7 (-1)); print_char '\n';
    print_int (ackermann 0 0); print_char '\n';
    print_int (ackermann 0 2); print_char '\n';
    print_int (ackermann 2 0); print_char '\n';
    print_int (ackermann 2 3); print_char '\n';
    print_int (ackermann 4 1); print_char '\n'

let () = main ()
