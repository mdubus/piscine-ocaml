let () =
  print_endline "\n*************** Add hours ***************\n";
  print_endline ("1h + 0h = "^(string_of_int (Watchtower.Watchtower.add 1 0))^"h");
  print_endline ("12h + 1h = "^(string_of_int (Watchtower.Watchtower.add 12 1))^"h");
  print_endline ("1h + 5h = "^(string_of_int (Watchtower.Watchtower.add 1 5))^"h");
  print_endline ("5h + 1h = "^(string_of_int (Watchtower.Watchtower.add 5 1))^"h");
  print_endline ("12h + 12h = "^(string_of_int (Watchtower.Watchtower.add 12 12))^"h");
  print_endline ("12h + 48h = "^(string_of_int (Watchtower.Watchtower.add 12 48))^"h");
  print_endline ("48h + 12h = "^(string_of_int (Watchtower.Watchtower.add 48 12))^"h");
  print_endline "\n*************** Sub hours ***************\n";
  print_endline ("1h - 0h = "^(string_of_int (Watchtower.Watchtower.sub 1 0))^"h");
  print_endline ("12h - 1h = "^(string_of_int (Watchtower.Watchtower.sub 12 1))^"h");
  print_endline ("1h - 5h = "^(string_of_int (Watchtower.Watchtower.sub 1 5))^"h");
  print_endline ("5h - 1h = "^(string_of_int (Watchtower.Watchtower.sub 5 1))^"h");
  print_endline ("12h - 1h = "^(string_of_int (Watchtower.Watchtower.sub 12 1))^"h");
  print_endline ("1h - 12h = "^(string_of_int (Watchtower.Watchtower.sub 1 12))^"h");
  print_endline ("12h - 12h = "^(string_of_int (Watchtower.Watchtower.sub 12 12))^"h");
  print_endline ("12h - 48h = "^(string_of_int (Watchtower.Watchtower.sub 12 48))^"h");
  print_endline ("48h - 12h = "^(string_of_int (Watchtower.Watchtower.sub 48 12))^"h");
