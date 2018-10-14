
let print a b c =
    print_int a;
    print_int b;
    print_int c;
    if a = 7 && b = 8 && c = 9 then print_string "\n"
    else print_string ", "


let rec get_c a b c =
    if c <= 9 then
        begin
            print a b c;
            get_c a b (c + 1)
        end

let rec get_b a b c =
    if b <= 8 then
        begin
            get_c a b c;
            get_b a (b + 1) (b + 2)
        end

let rec get_a a b c =
    if a <= 7 then
        begin
            get_b a b c;
            get_a (a + 1) (a + 2) (a + 3)
        end

let ft_print_comb () =
    let a = 0 in
    let b = a + 1 in
    let c = b + 1
    in
    get_a a b c

let () = ft_print_comb ()
