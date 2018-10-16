(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   btree.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/05 09:32:29 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 12:27:10 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree =
    | Nil
    | Node of 'a * 'a tree * 'a tree

let is_lower low high =
    if low < high then true
    else false

let is_bigger high low =
    if high > low then true
    else false

let is_bst tree =
    let rec check tree =
        match tree with
        | Node (v, l, r) ->
            begin
                let (lv, ll, lr) = l in
                let (rv, rl, rr) = l in
                if (if_lower lv v && is_lower rv v && is_lower lv rv) then (check l; check r)
                else false
            end
        | Nil -> true


let main () =
    print_string (string_of_bool (is_bst (Node (4, Node (2, Node (1, Nil, Nil), Node (3, Nil, Nil)),Node (2, Nil, Nil)))))

let () = main ()
