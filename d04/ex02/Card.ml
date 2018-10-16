(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Card.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/05 15:38:10 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/05 20:08:35 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Color =
    struct

    type t = Spade | Heart | Diamond | Club

    let all = [Spade; Heart; Diamond; Club ]

    let toString t =
        match t with
        | Spade -> "S" | Heart -> "H" | Diamond -> "D" | Club -> "C"

    let toStringVerbose t =
        match t with
        | Spade -> "Spade" | Heart -> "Heart" | Diamond -> "Diamond" | Club -> "Club"
end

module Value =
    struct

    type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

    let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As ]

    let toInt t =
        match t with
        | T2 -> 1 | T3 -> 2 | T4 -> 3 | T5 -> 4 | T6 -> 5 | T7 -> 6 | T8 -> 7
        | T9 -> 8 | T10 -> 9 | Jack -> 10 | Queen -> 11 | King -> 12 | As -> 13

    let toString t =
        match t with
        | T2 -> "2"
        | T3 -> "3"
        | T4 -> "4"
        | T5 -> "5"
        | T6 -> "6"
        | T7 -> "7"
        | T8 -> "8"
        | T9 -> "9"
        | T10 -> "10"
        | Jack -> "J"
        | Queen -> "Q"
        | King -> "K"
        | As -> "A"

    let toStringVerbose t =
        match t with
        | T2 -> "2"
        | T3 -> "3"
        | T4 -> "4"
        | T5 -> "5"
        | T6 -> "6"
        | T7 -> "7"
        | T8 -> "8"
        | T9 -> "9"
        | T10 -> "10"
        | Jack -> "Jack"
        | Queen -> "Queen"
        | King -> "King"
        | As -> "As"

    let next t =
        let rec find_next l card =
            match l with
            | head :: next :: tail when head = card -> next
            | head :: tail -> find_next tail card
            | [] -> invalid_arg "no next card"
        in find_next all t

    let prev t =
        let rec find_prev l card =
            match l with
            | head :: next :: tail when next = card -> head
            | head :: tail -> find_prev tail card
            | [] -> invalid_arg "no prev card"
        in find_prev all t

end

type t = {
    value: Value.t;
    color: Color.t
}

let newCard v c = {value = v; color = c}

let allSpades = List.map (function x -> (newCard x Color.Spade)) Value.all
let allHearts = List.map (function x -> (newCard x Color.Heart)) Value.all
let allDiamonds = List.map (function x -> (newCard x Color.Diamond)) Value.all
let allClubs = List.map (function x -> (newCard x Color.Club)) Value.all
let all = allSpades @ allHearts @ allDiamonds @ allClubs

let getValue t = t.value
let getColor t = t.color

let toString t = Printf.sprintf "%s%s" (Value.toString t.value) (Color.toString t.color)
let toStringVerbose t = Printf.sprintf "Card(%s, %s)" (Value.toStringVerbose t.value) (Color.toStringVerbose t.color)

let compare x y =
    if x = y then 0
    else if x < y then (-1)
    else 1

let max x y =
    if y > x then y
    else x

let min x y =
    if y < x then y
    else x

let isOf t c = t.color = c
let isSpade t = t.color = Color.Spade
let isHeart t = t.color = Color.Heart
let isDiamond t = t.color = Color.Diamond
let isClub t = t.color = Color.Club

let best l =
    match l with
    [] -> invalid_arg "empty list"
    | head :: tail -> List.fold_left max head tail
