let is_digit c =
    c >= '0' && c <= '9'

let ft_string_all f s =
    let rec compare f s i =
        if f (String.get s i) = false  then
            false
        else
            if i = 0 then true
            else compare f s (i - 1)
    in String.length s > 0 && compare f s (String.length s - 1)

let main () =
    print_endline(string_of_bool (ft_string_all is_digit "a123456789"));
    print_endline(string_of_bool (ft_string_all is_digit "0123a56789"));
    print_endline(string_of_bool (ft_string_all is_digit "012345678a"));
    print_endline(string_of_bool (ft_string_all is_digit "0123456789"));
    print_endline(string_of_bool (ft_string_all is_digit "a"));
    print_endline(string_of_bool (ft_string_all is_digit "1"));
    print_endline(string_of_bool (ft_string_all is_digit ""))

let () = main ()
