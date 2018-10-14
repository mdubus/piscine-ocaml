
let print a b =
    if a < 10 then print_int 0;
    print_int a;
    print_char ' ';
    if b < 10 then print_int 0;
    print_int b;
    if a = 98 && b = 99 then print_char '\n'
    else print_char ',' ; print_char ' '

let rec get_b a b =
    if b <= 99 then
        begin
            print a b;
            get_b a (b + 1)
        end

let rec get_a a b  =
    if a <= 98 then
        begin
            get_b a b ;
            get_a (a + 1) (a + 2)
        end

let ft_print_comb () =
    let a = 0 in
    let b = a + 1 in
    get_a a b

let () = ft_print_comb ()
