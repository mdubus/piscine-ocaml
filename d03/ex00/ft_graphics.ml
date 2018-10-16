(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_graphics.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/04 14:00:21 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/04 17:29:07 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree =
    | Nil
    | Node of 'a * 'a tree * 'a tree

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
    in draw tree 400 500

let main () =
    Graphics.open_graph " 800x600";
    draw_tree_node (Node ("test", Node ("test2", Nil, Nil), Nil));
    ignore(Graphics.read_key ())

let () = main ()
