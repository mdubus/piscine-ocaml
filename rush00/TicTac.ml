type matrix = | List of matrix list
              | Sym of Symbol.t

type t = {
    width: int;
    depth: int;
    matrix: matrix;
  }

let rec create (width: int) (depth: int) : t =
  let rec aux depth =
    if depth = 0 then Sym (Symbol.None)
    else List (List.init (width * width) (fun _i -> (aux  (depth - 1))))
  in
  {
    width = width;
    depth = depth;
    matrix = aux depth;
  }

let getWidth t = t.width
let getDepth t = t.depth

let flatenCoord l c width =
  l * width + c

let getCurrentLineColon (l: int) (c: int) (width: int) (depth: int) =
  let width_inferieur = (Utils.power width (depth - 1)) in
  let current_l = (l / width_inferieur) in
  let current_c = (c / width_inferieur) in
  (current_l, current_c)

let getNextIndex (l: int) (c: int) (width: int) (depth: int) =
  let width_inferieur = (Utils.power width (depth - 1)) in
  ((l mod width_inferieur), (c mod width_inferieur))

let getSymbol (tictac: t) (l: int) (c: int) : (Symbol.t * int * int * int)=
  let rec aux (matrix: matrix) (l: int) (c: int) (width: int) (depth: int) =
    match matrix with
    | Sym (s) -> (s, depth, l, c)
    | List (m) -> let (curr_l, curr_c) = getCurrentLineColon l c width depth in
                  let (next_l, next_c) = getNextIndex l c width depth in
                  aux (List.nth m (flatenCoord curr_l curr_c width)) (next_l) (next_c) width (depth - 1)
  in
  aux tictac.matrix l c tictac.width tictac.depth

let checkWin (matrix:matrix list) (width: int) (symbol: Symbol.t) (curr_l: int) (curr_c: int) =
  let checkWinLine () =
    let rec aux l = 
      if l = width then true
      else Sym(symbol) = (List.nth matrix (flatenCoord curr_l l width)) && aux (l + 1)
    in
    aux 0
  in
  let checkWinColon () =
    let rec aux c = 
      if c = width then true
      else Sym(symbol) = (List.nth matrix (flatenCoord c curr_c width)) && aux (c + 1)
    in
    aux 0
  in
  let checkDiag () =
    let rec aux2 c =
      if c = width then true
      else Sym(symbol) = (List.nth matrix (flatenCoord c (width - 1 - c) width))
           && aux2 (c + 1)
    in
    let rec aux c = 
      if c = width then true
      else Sym(symbol) = (List.nth matrix (flatenCoord c c width))
           && aux (c + 1)
    in
    aux 0 || aux2 0
  in
  let full () =
    List.for_all (fun x -> match x with | Sym (Symbol.O) | Sym (Symbol.X) -> true | _ -> false) matrix
  in
  if checkWinLine () || checkWinColon () || checkDiag () || full ()
  then begin print_endline "win"; Sym (symbol) end
  else List (matrix)

let putSymbol (tictac: t) (symbol: Symbol.t) (l: int) (c: int)  : t =
  let rec aux (matrix: matrix) (l: int) (c: int) (width: int) (depth: int) =
    if depth = 0 then Sym (symbol)
    else
      begin
        match matrix with
        | Sym (s) -> Sym (s)
        | List (m) -> let (next_l, next_c) = getNextIndex l c width depth in
                      let (curr_l, curr_c) = getCurrentLineColon l c width depth in
                      let current_index = (flatenCoord curr_l curr_c width) in
                      checkWin (Utils.replace m current_index (aux (List.nth m current_index) next_l next_c width (depth - 1))) width symbol curr_l curr_c
      end
  in
  let new_matrix = aux tictac.matrix l c tictac.width tictac.depth
  in
  {width = tictac.width; depth = tictac.depth; matrix = new_matrix}

(***************************** To String *****************************)

let get_sep_hor n width =
  let nb = Utils.padique n width in
  if nb > 0 then (String.make nb '|') ^ " "
  else ""

let get_sep_ver n width widthstring =
  let nb = Utils.padique n width in
  if nb > 0 then Utils.repeat_string ~str:((String.make widthstring '-') ^ "\n") nb
  else ""

let getSymbolString symbdepth width =
  match symbdepth with
  | (s, 0, _, _) -> Symbol.toString s
  | (Symbol.X, curr_depth, l, c) ->
     let width_act = Utils.power width curr_depth in
     let middle = width_act / 2 in
     if width mod 2 = 0 then Symbol.toString Symbol.X
     else if l = c then
       begin
         if l = middle then Symbol.toString Symbol.X
         else "\\"
       end
     else if l = width_act - 1 - c then "/"
     else " "
  | (Symbol.O, curr_depth, l, c) ->
     let width_act = Utils.power width curr_depth in
     if l = 0 && c = 0 || l = (width_act - 1) && c = (width_act - 1)
     then "/"
     else if l = (width_act - 1) && c = 0 || l = 0 && c = (width_act - 1)
     then "\\"
     else if c = 0 || c = (width_act - 1)
     then "|"
     else if l = 0 || l = (width_act - 1)
     then "-"
     else " "
  | _ -> "?"

let toString tictac =
  let cur_width = Utils.power tictac.width tictac.depth in
  let rec aux_col acc l c =
    if c = cur_width then acc
    else aux_col (acc ^ " " ^ (get_sep_hor c tictac.width) ^ (getSymbolString (getSymbol tictac l c) tictac.width)) l (c + 1)
  in
  let rec aux_lines acc l =
    if l = cur_width then acc
    else let line = (aux_col "" l 0) in aux_lines (acc ^ "\n" ^ (get_sep_ver l tictac.width (String.length line)) ^ line) (l + 1)
  in
  aux_lines "" 0

(***************************************************************************)

type playSymbolResult =
  |IllegalMove
  |Win of t
  |NewTicTac of t

let playSymbol tictac symbol l c =
  match getSymbol tictac (l - 1) (c - 1) with
  | (None, 0, _, _) ->
     begin
       let new_tic_tac = putSymbol tictac symbol (l - 1) (c - 1)
       in
       match new_tic_tac.matrix with
       | Sym(_) -> Win (new_tic_tac)
       | _ -> NewTicTac (new_tic_tac)
     end
  | _ ->  IllegalMove
