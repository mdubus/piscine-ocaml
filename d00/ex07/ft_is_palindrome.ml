let ft_is_palindrome s =
    let rec check s b e =
        if b > e || b = e then true
        else if (String.get s b) <> (String.get s e) then false
        else check s (b + 1) (e - 1)
    in check s 0 ((String.length s) - 1)

let main () =
    print_endline(string_of_bool(ft_is_palindrome "radar"));
    print_endline(string_of_bool(ft_is_palindrome "maddam"));
    print_endline(string_of_bool(ft_is_palindrome "madam"));
    print_endline(string_of_bool(ft_is_palindrome "Madam"));
    print_endline(string_of_bool(ft_is_palindrome "amor roma"));
    print_endline(string_of_bool(ft_is_palindrome "car"));
    print_endline(string_of_bool(ft_is_palindrome "r"));
    print_endline(string_of_bool(ft_is_palindrome ""))

let () = main ()
