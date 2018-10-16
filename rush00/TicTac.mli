type t

val create: int -> int -> t

val toString: t -> string

type playSymbolResult =
  |IllegalMove
  |Win of t
  |NewTicTac of t

val playSymbol: t -> Symbol.t -> int -> int -> playSymbolResult
val getWidth: t -> int
val getDepth: t -> int
