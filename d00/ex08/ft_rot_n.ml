let rotate x n =
    let res = (int_of_char x) + n in
    if (x >= 'a' && x <= 'z') then
        if res > int_of_char 'z' then char_of_int(res - 26)
        else char_of_int res
    else if (x >= 'A' && x <= 'Z') then
        if res > int_of_char 'Z' then char_of_int(res - 26)
        else char_of_int res
    else x

let ft_rot_n n s =
    String.map (function x -> rotate x (n mod 26)) s

let main () =
    print_endline (ft_rot_n 1 "z" );
    print_endline (ft_rot_n 25 "z" );
    print_endline (ft_rot_n 27 "Z" );
    print_endline (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz" );
    print_endline (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz" );
    print_endline (ft_rot_n 1 "0123456789" );
    print_endline (ft_rot_n 2 "OI2EAS67B9" );
    print_endline (ft_rot_n 13 "" );
    print_endline (ft_rot_n 150 "xyz" );
    print_endline (ft_rot_n 1 "NBzlk qnbjr !" )

let () = main ()
