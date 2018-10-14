let ft_print_rev s =
    let rec print s x =
        if x <= 0 then print_char '\n'
        else
            begin
                print_char (String.get s (x - 1));
                print s (x - 1)
            end
    in
    print s (String.length s)

let main () =
    ft_print_rev "Hello";
    ft_print_rev "\n";
    ft_print_rev "Ceci est un test";
    ft_print_rev ""

let () = main ()
