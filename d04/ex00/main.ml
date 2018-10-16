(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/05 13:41:04 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 13:57:04 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec print_card_types l =
    match l with
    | head :: tail ->
        begin
            print_endline "\nTo string : ";
            print_endline (Color.toString head);
            print_endline "To string verbose : ";
            print_endline (Color.toStringVerbose head);
            print_card_types tail
        end
    | _ -> ()

let main () =
    print_card_types Color.all

let () = main ()
