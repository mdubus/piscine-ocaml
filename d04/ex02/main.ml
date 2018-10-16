(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/05 15:53:37 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 20:08:34 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let card = Card.newCard Card.Value.T2 Card.Color.Spade in
    let s3 = Card.newCard Card.Value.T3 Card.Color.Spade in
    let h3 = Card.newCard Card.Value.T3 Card.Color.Heart in
    let d3 = Card.newCard Card.Value.T3 Card.Color.Diamond in
    let c3 = Card.newCard Card.Value.T3 Card.Color.Club in
    let jack = Card.newCard Card.Value.Jack Card.Color.Heart in
    let spades = Card.allSpades in
    let hearts = Card.allHearts in
    let diamonds = Card.allDiamonds in
    let clubs = Card.allClubs in
    let all = Card.all in
    let l = [s3; h3; jack; c3; d3] in

    print_endline "\n********** Card Creation **********\n";
    Printf.printf "%s %s\n" (Card.Value.toStringVerbose card.value) (Card.Color.toStringVerbose card.color);

    print_endline "\n********** Card getter **********\n";
    Printf.printf "Getting card value : %s\n" (Card.Value.toStringVerbose (Card.getValue card));
    Printf.printf "Getting card color : %s\n" (Card.Color.toStringVerbose (Card.getColor card));

    print_endline "\n********** Compare **********\n";
    Printf.printf "Compare 3S with Jack : %d\n" (Card.compare s3 jack);
    Printf.printf "Compare Jack with 3S : %d\n" (Card.compare jack s3);
    Printf.printf "Compare 3S with 3S : %d\n" (Card.compare s3 s3);

    print_endline "\n********** Min && Max **********\n";
    Printf.printf "Min 3S with Jack : %s\n" (Card.toString (Card.min s3 jack));
    Printf.printf "Min Jack with S3 : %s\n" (Card.toString (Card.min jack s3));
    Printf.printf "Min S3 with S3 : %s\n\n" (Card.toString (Card.min s3 s3));
    Printf.printf "Max 3S with Jack : %s\n" (Card.toString (Card.max s3 jack));
    Printf.printf "Max Jack with S3 : %s\n" (Card.toString (Card.max jack s3));
    Printf.printf "Max Jack with Jack : %s\n" (Card.toString (Card.max jack jack));

    print_endline "\n********** 'Is' functions **********\n";
    Printf.printf "IsOf S3 - Spade : %b\n" (Card.isOf s3 Card.Color.Spade);
    Printf.printf "IsOf S3 - Heart : %b\n" (Card.isOf s3 Card.Color.Heart);
    Printf.printf "IsOf S3 - Diamond : %b\n" (Card.isOf s3 Card.Color.Diamond);
    Printf.printf "IsOf S3 - Club : %b\n\n" (Card.isOf s3 Card.Color.Club);

    Printf.printf "IsSpade S3 - Spade : %b\n" (Card.isSpade s3);
    Printf.printf "IsSpade H3 - Spade : %b\n" (Card.isSpade h3);
    Printf.printf "IsSpade D3 - Spade : %b\n" (Card.isSpade d3);
    Printf.printf "IsSpade C3 - Spade : %b\n\n" (Card.isSpade c3);

    Printf.printf "IsHeart S3 - Heart : %b\n" (Card.isHeart s3);
    Printf.printf "IsHeart H3 - Heart : %b\n" (Card.isHeart h3);
    Printf.printf "IsHeart D3 - Heart : %b\n" (Card.isHeart d3);
    Printf.printf "IsHeart C3 - Heart : %b\n\n" (Card.isHeart c3);

    Printf.printf "IsDiamond S3 - Diamond : %b\n" (Card.isDiamond s3);
    Printf.printf "IsDiamond H3 - Diamond : %b\n" (Card.isDiamond h3);
    Printf.printf "IsDiamond D3 - Diamond : %b\n" (Card.isDiamond d3);
    Printf.printf "IsDiamond C3 - Diamond : %b\n\n" (Card.isDiamond c3);

    Printf.printf "IsClub S3 - Club : %b\n" (Card.isClub s3);
    Printf.printf "IsClub H3 - Club : %b\n" (Card.isClub h3);
    Printf.printf "IsClub D3 - Club : %b\n" (Card.isClub d3);
    Printf.printf "IsClub C3 - Club : %b\n" (Card.isClub c3);

    print_endline "\n********** All Hearts to String **********\n";
    List.iter (function x -> print_endline (Card.toString x)) hearts;

    print_endline "\n********** All Hearts to String Verbose **********\n";
    List.iter (function x -> print_endline (Card.toStringVerbose x)) hearts;

    print_endline "\n********** All Spades to String Verbose **********\n";
    List.iter (function x -> print_endline (Card.toStringVerbose x)) spades;

    print_endline "\n********** All Diamonds to String Verbose **********\n";
    List.iter (function x -> print_endline (Card.toStringVerbose x)) diamonds;

    print_endline "\n********** All Clubs to String Verbose **********\n";
    List.iter (function x -> print_endline (Card.toStringVerbose x)) clubs;

    print_endline "\n********** All to String Verbose **********\n";
    List.iter (function x -> print_endline (Card.toStringVerbose x)) all;

    print_endline "\n********** Best **********\n";
    Printf.printf "Best of list : %s\n" (Card.toString (Card.best l));

    print_endline "\n********** Best of empty list **********\n";
    Printf.printf "Best of list : %s\n" (Card.toString (Card.best []));
