(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/02 14:17:26 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/02 18:23:14 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_sum f low high =
    if high < low then nan
    else
        let rec sum low res =
            if low > high then res
            else sum (low + 1) (res +. f(low))
        in sum low  0.0

let main () =
    print_float (ft_sum (fun i -> float_of_int (i * i)) 10 1) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) 1 1) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) 1 0) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) 0 1) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) 0 0) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) (-1) 1) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) 1 (-1)) ; print_char '\n';
    print_float (ft_sum (fun i -> float_of_int (i * i)) 1 10) ; print_char '\n'

let () = main ()
