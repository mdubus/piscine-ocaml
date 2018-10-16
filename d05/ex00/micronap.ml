(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/08 11:32:23 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/08 11:32:24 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1

let take_a_nap s =
  if s < 0 then invalid_arg "please provide a positive number"
  else
    for i = 1 to s do
      my_sleep()
    done

let micronap () =
  let argv = Sys.argv in
  try
    match Array.length argv with
    | 2 -> take_a_nap (int_of_string (argv.(1)))
    | _ -> failwith "usage : ./a.out [seconds]"
  with
  | Failure err -> print_endline ("Error : "^err)
  | Invalid_argument err -> print_endline ("Error : "^err)
  | _ -> ()

let () =
  micronap ()
