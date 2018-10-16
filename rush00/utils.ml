
let rec power elem n =
  if n < 0 then 0
  else if n == 0 then 1
  else
    let half = power elem (n / 2)
    in
    if n mod 2 == 0 then half * half else elem * (half * half)

let replace list n new_elem =
  List.mapi (fun i e -> if i = n then new_elem else e) list

let rec padique n p =
  if n = 0 then 0
  else if (n mod p) = 0
   then 1 + padique (n / p) p
  else 0

let rec repeat_string ?(str="x") n =
  let rec power init elem error n opp =
    if n < 0 then error
    else if n == 0 then init
    else
      let half = power init elem error (n / 2) opp
      in
      if n mod 2 == 0 then opp half half else opp elem (opp half half)
  in
  power "" str "Error" n (^)
