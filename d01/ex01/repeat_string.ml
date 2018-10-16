let repeat_string ?(str="x") n =
    if n < 0 then "Error"
    else
        let rec construct n str start =
            if n = 0 then start
            else construct (n - 1) str (start ^ str)
        in construct n str ""

let main () =
    print_endline (repeat_string (-1));
    print_endline (repeat_string 0);
    print_endline (repeat_string 1);
    print_endline (repeat_string 3);
    print_endline (repeat_string ~str:"Toto" (-1));
    print_endline (repeat_string ~str:"Toto" 0);
    print_endline (repeat_string ~str:"Toto" 1);
    print_endline (repeat_string ~str:"Toto" 3)

let () = main ()
