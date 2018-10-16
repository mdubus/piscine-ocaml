(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/08 14:19:05 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/16 13:39:09 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  Random.self_init ();
  let joke1 = "Quelle mamie fait peur aux voleurs ? Mamie traillette" in
  let joke2 = "J'ai une blague sur les magasins. Mais elle a pas supermarche" in
  let joke3 = "que faisaient les dinosaures quand ils n'arrivaient pas a se decider ? Des tirageosaures" in
  let joke4 = "Que se passe-t-il quand 2 poissons s'enervent ? Le thon monte" in
  let joke5 = "Que dit une imprimante dans l'eau ? J'ai papier" in
  let joke6 = "Que fait Platon quand ca le demange ? Il Socrate" in
  let jokes = [| joke1;joke2;joke3;joke4;joke5;joke6 |] in
  print_endline jokes.( Random.int (Array.length jokes))
