(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/06 10:48:26 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/06 11:16:58 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type player = {
    name : string;
    symbol : Symbol.t;
  }

(********************************* UTILS *********************************)

(*************************** Get player's names ***************************)
let rec get_player_name ?(j1= "") ?(j2 ="") () =
  let name = read_line() in
  match name with
  | name when String.length name = 0 -> print_endline "Illegal name" ; get_player_name ~j1 ~j2 ()
  | name when (name = j1 || name = j2) -> print_endline "Illegal name" ; get_player_name ~j1 ~j2 ()
  | _ -> name

let get_players () =
  print_endline "Enter player 1's name";
  let j1 = {
      name= get_player_name ();
      symbol= Symbol.O;
    }
  in
  print_string "player 1 is : ";
  print_endline j1.name;
  print_endline "\nEnter player 2's name";
  let j2 = {
      name = get_player_name ~j1: j1.name ();
      symbol = Symbol.X;
    }
  in
  print_string "player 2 is : ";
  print_endline j2.name;
  (j1, j2)

(***************************** Get coordinates *****************************)

let check_coordinate tictac coord =
  (int_of_string_opt coord) <> None && int_of_string coord > 0 && int_of_string coord <= (Utils.power (TicTac.getWidth tictac) (TicTac.getDepth tictac))

let rec get_coord tictac =
  let list_cord =  String.split_on_char ' ' (String.trim (read_line()))
  in
  match list_cord with
  | fst::scd::[] when (check_coordinate tictac fst && check_coordinate tictac scd) -> (int_of_string fst,int_of_string scd)
  | _ ->
     begin
       print_endline "Invalid coordinates. Please try again : ";
       get_coord tictac
     end


(****************************** On each turn ******************************)


let rec play_again aux tictac j1 =
  print_endline "Do you want to play again ? (y / n)";
  let answer = read_line() in
  match answer with
  | "y" -> aux (TicTac.create (TicTac.getWidth tictac) (TicTac.getDepth tictac)) j1
  | "n" -> print_endline "Goodbye !"
  | _ -> print_endline "\nPlease answer the question : " ; play_again aux tictac j1

let rec game tictac j1 j2 =
  let rec aux tictac player =

    print_string ("\n"^player.name);
    print_string "'s turn to play (";
    print_string (Symbol.toString player.symbol);
    print_endline ").";
    let (l, c) = get_coord tictac
    in
    match TicTac.playSymbol tictac player.symbol l c with
    | NewTicTac(newtictac) -> begin
        print_endline (TicTac.toString newtictac);
        let new_player = match player.symbol with | Symbol.O -> j2 | Symbol.X -> j1 | _ -> j1 in
        aux newtictac new_player
      end
    | IllegalMove -> begin print_endline "Illegal move"; aux tictac player end
    | Win(endgame) ->
       begin
         print_endline (TicTac.toString endgame);
         print_string player.name;
         print_string (" ("^(Symbol.toString player.symbol)^")");
         print_endline " won. Congratulations ! \n";
         play_again aux tictac j1;
       end
  in
  aux tictac j1


(********************************* GAME *********************************)

let check_input value min_size =
  (int_of_string_opt value) <> None && (int_of_string value) >= min_size

let () =
  match Array.to_list Sys.argv with
  | _::width::depth::[] when check_input width 2 && check_input depth 1 ->
     begin
       let tictac = TicTac.create (int_of_string width) (int_of_string depth) in
       let (j1, j2) = get_players () in
       print_endline (TicTac.toString tictac);
       game tictac j1 j2;
     end
  | _ -> print_endline "usage: ./tic_tac_toe [width >= 2] [depth >=1]"
