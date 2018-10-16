(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gardening.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/04 17:41:35 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/04 19:14:07 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree =
    | Nil
    | Node of 'a * 'a tree * 'a tree

let rec size tree =
    match tree with
    | Nil -> 0
    | Node (v, l, r) -> 1 + size l + size r

let rec height tree =
    match tree with
    | Nil -> 0
    | Node (v, l, r) ->
        begin
            let ldepth = height l in
            let rdepth = height r in
            if ldepth > rdepth then ldepth + 1
        else rdepth + 1
        end

let draw_square x y size =
    Graphics.moveto (x - (size / 2)) (y + (size / 2));
    Graphics.lineto (x + (size / 2)) (y + (size) / 2);
    Graphics.lineto (x + (size / 2)) (y - (size) / 2);
    Graphics.lineto (x - (size / 2)) (y - (size) / 2);
    Graphics.lineto (x - (size / 2)) (y + (size) / 2)

let draw_line cx cy nx ny =
    Graphics.moveto cx cy;
    Graphics.lineto nx ny

let draw_node v x y size =
    draw_square x y size;
    Graphics.moveto (x - (size / 2) + 20) (y - 5);
    Graphics.draw_string v;
    if (v <> "Nil") then
        begin
            draw_line x (y - (size / 2)) (x - 100) (y - 150 + (size / 2));
            draw_line x (y - (size / 2)) (x + 100) (y - 150 + (size / 2))
        end

let draw_tree_node tree =
    let rec draw tree x y =
    match tree with
    | Node (v, l, r) ->
        begin
           draw_node v x y 100 ;
           draw l (x - 100) (y - 150);
           draw r (x + 100) (y - 150)
        end
    | Nil -> draw_node "Nil" x y 100
    in draw tree 400 600

let main () =
    print_string "size : ";
    print_int (size (Node ("test", Node ("test2", Nil, Nil), Node ("test3", Nil, Nil))));
    print_char '\n';
    print_string "size : ";
    print_int (size (Nil));
    print_char '\n';
    print_string "height : ";
    print_int (height (Node ("test", Node ("test2", Nil, Nil), Node ("test3", Nil, Nil))));
    print_char '\n';
    print_string "height : ";
    print_int (height (Nil));
    print_char '\n';
    Graphics.open_graph " 800x700";
    draw_tree_node (Node ("test", Node ("test2", Nil, Node ("test3", Nil, Nil)), Nil));
    ignore(Graphics.read_key ())

let () = main ()
