let ft_print_alphabet () =
    let rec print_letter x =
        if x > int_of_char 'z' then print_char '\n'
        else
            begin
                print_char (char_of_int x);
                print_letter (x + 1)
            end
    in
    print_letter (int_of_char 'a')

let () = ft_print_alphabet ()
