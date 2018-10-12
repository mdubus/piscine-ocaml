module Watchtower =
struct
  type hour = int
  let zero:hour = 12
  let add (x:hour) (y:hour) =
    let res = (x + y) mod zero in
    if res = 0 then zero
    else (res:hour)
  let sub (x:hour) (y:hour) =
    let res = (x - y) mod zero in
    if res <= 0 then res + zero
    else (res:hour)
end
