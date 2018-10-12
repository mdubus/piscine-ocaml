let print_proj ((p, s, n):App.App.project) =
  Printf.printf "Project '%s' %s with score %d\n" p s n

let () =
  print_endline "\n*************** Combine ***************\n";
  print_proj (App.App.combine ("42", "Failed", 42) ("sh", "Succeed", 72));
  print_proj (App.App.combine ("42", "Succeed", 80) ("sh", "Succeed", 82));
  print_endline "\n*************** Zero ***************\n";
  print_proj (App.App.zero);
  print_endline "\n*************** Fail ***************\n";
  print_proj (App.App.fail ("42sh", "Failed", 42));
  print_endline "\n*************** Success ***************\n";
  print_proj (App.App.success ("42sh", "Failed", 42));
