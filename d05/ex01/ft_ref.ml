(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mdubus <mdubus@student.42.fr>              +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2018/10/08 13:13:42 by mdubus            #+#    #+#             *)
(*   Updated: 2018/10/08 13:13:43 by mdubus           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ft_ref = {
  mutable contents: 'a
}

let return v = {contents= v}
let get r = r.contents
let set r v = r.contents <- v
let bind r f:'b ft_ref = f (get r)

let () =
  print_endline "Return a new ref with value 42 : ";
  let r = return 42 in
  print_int r.contents;

  print_endline "\n\nGet the value of a ref : ";
  print_int (get r);

  print_endline "\n\nSet the value of a ref. Value is now 21 : ";
  set r 21;
  print_int (get r);

  print_endline "\n\nApplies a function to a reference and transform it : ";
  let newRef = bind r (fun x -> return 42) in
  print_int (get newRef);
  print_char '\n'
