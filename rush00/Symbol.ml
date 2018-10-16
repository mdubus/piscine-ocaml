
type t = O | X | None

let toString symbol =
    match symbol with
    | O -> "O"
    | X -> "X"
    | None -> "-"
