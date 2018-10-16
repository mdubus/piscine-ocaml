let repeat_x n =
    if n < 0 then "Error"
    else
        let rec construct n s =
            if n = 0 then s
            else
                construct (n - 1) (s ^ "x")
        in construct n ""

let main () =
    print_endline (repeat_x (-1));
    print_endline (repeat_x 0);
    print_endline (repeat_x 1);
    print_endline (repeat_x 2);
    print_endline (repeat_x 10)

let () = main ()
