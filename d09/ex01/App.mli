module App :
  sig
    type project = string * string * int
    val zero : project
    val combine : project -> project -> project
    val fail : project -> project
    val success : project -> project
  end
