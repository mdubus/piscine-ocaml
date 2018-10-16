(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/02 13:24:11 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/02 13:54:11 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec converges f start n =
    if n < 0 then false
    else if start = f start then true
    else converges f (f start) (n - 1)

let main () =
    print_endline (string_of_bool (converges (( * ) 2) 2 5));
    print_endline (string_of_bool (converges (fun x -> x / 2) 2 3));
    print_endline (string_of_bool (converges (fun x -> x / 2) 2 2));
    print_endline (string_of_bool (converges (fun x -> x / 2) 2 (-1)));
    print_endline (string_of_bool (converges (fun x -> x / 2) 2 0));
    print_endline (string_of_bool (converges (fun x -> x / 2) (-1) 2));
    print_endline (string_of_bool (converges (fun x -> x / 2) 0 2))

let () = main ()
