module App =
struct
  type project = string * string * int

  let zero:project = ("", "", 0)

  let combine ((ap,_,an):project) ((bp,_,bn):project) =
    let new_project_name = ap^bp
    and new_project_score = (an+bn) / 2 in
    if new_project_score > 80 then ((new_project_name, "succeed", new_project_score):project)
    else ((new_project_name, "failed", new_project_score):project)

  let fail ((p,_,_):project) = ((p, "failed", 0):project)

  let success ((p,_,_):project) = ((p, "succeed", 80):project)

end
