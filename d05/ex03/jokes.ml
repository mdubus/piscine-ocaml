(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/08 14:48:35 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/08 14:48:36 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let get_joke file =
  let fd = open_in file in
  let arr = ref [||] in
    try
      while true do
        let line = input_line fd in
        arr := Array.append !arr (Array.make 1 line)
      done ; assert false
    with End_of_file -> close_in fd ; !arr



let () =
  Random.self_init ();
  let argv = Sys.argv in
  try
    match Array.length argv with
    | 2 ->
      begin
        let arr = get_joke argv.(1) in
        print_endline arr.( Random.int (Array.length arr))
      end
    | _ -> failwith "usage : ./a.out [file]"
  with
  | Failure err -> print_endline ("Error : "^err)
  | Invalid_argument err -> print_endline ("Error : "^err)
  | Sys_error err -> print_endline ("Error : "^err)
  | _ -> print_endline "Error"
