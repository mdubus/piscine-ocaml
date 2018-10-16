(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/05 14:00:23 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 15:35:46 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(******************* PRINT INT *****************)

let rec print_card_value l =
    match l with
    | head :: tail ->
        begin
            print_string ("Value of "^(Value.toStringVerbose head)^" : ");
            print_int (Value.toInt head);
            print_char '\n';
            print_card_value tail
        end
    | _ -> ()

(******************* PRINT NEXT *****************)

let print_next head =
    try print_string (Value.toStringVerbose (Value.next head));
    with error -> print_string "Error"

let rec print_card_asc l =
    match l with
    | head :: tail ->
        begin
            print_string ("Next of "^(Value.toString head)^" is : ");
            print_next head;
            print_char '\n';
            print_card_asc tail
        end
    | _ -> ()

(******************* PRINT PREV *****************)

let print_prev head =
    try print_string (Value.toStringVerbose (Value.prev head));
    with error -> print_string "Error"

let rec print_card_desc l =
    match l with
    | head :: tail ->
        begin
            print_string ("Prev of "^(Value.toString head)^" is : ");
            print_prev head;
            print_char '\n';
            print_card_desc tail
        end
    | _ -> ()

(****************** MAIN *******************)

let main () =
    print_card_value Value.all;
    print_char '\n';
    print_card_asc Value.all;
    print_char '\n';
    print_card_desc Value.all

let () = main ()
