
let rec main_loop time tama pressed =
  if (Graphics.button_down () && pressed = false)
  then Utils.dispatch_action main_loop time tama
  else if (Sys.time ()) -. time >= 1.0 then
    begin
      Utils.draw_changes tama;
      Utils.save tama;
      if tama#is_dead
      then
        begin
          tama_dead tama ;
          Graphics.close_graph()
        end
      else main_loop (Sys.time ()) tama#loose_life (Graphics.button_down ())
    end
  else main_loop time tama (Graphics.button_down ())

and tama_dead tama =
  Graphics.clear_graph();
  Graphics.draw_image (Graphics.make_image (Utils.get_image "Dead")) 0 (Utils.window.height - 653);
  Graphics.moveto 700 350;
  Graphics.draw_string "you died bro";
  Graphics.synchronize ();
  Utils.draw_button Utils.play_again_x Utils.play_again_y Utils.play_again_width Utils.heightbuttons "PLAY AGAIN";

  let rec play_again_loop tama pressed =
    if (Graphics.button_down () && pressed = false) then
      begin
        let (x, y) = Graphics.mouse_pos() in
        if x >= Utils.play_again_x && x <= (Utils.play_again_x + Utils.play_again_width)
           && y >= (Utils.play_again_y - Utils.heightbuttons) && y <= Utils.play_again_y
        then
          begin
            let new_tama = tama#get_new in
            Utils.draw_all new_tama "";
            main_loop (Sys.time ()) new_tama (Graphics.button_down ())
          end
        else play_again_loop tama (Graphics.button_down ());
      end
    else play_again_loop tama (Graphics.button_down ());
  in try
    play_again_loop tama (Graphics.button_down ())
  with
  | Graphics.Graphic_failure("fatal I/O error") -> print_endline "Goodbye !"
  | Sys_error e -> prerr_endline ("Error : "^e)
  | _             -> prerr_endline "Error: unknown error"; exit 1


let () =
  Graphics.open_graph " 1000x800";

  let loading = new Pikachu.pikachu 100 100 100 100 in
  let first_pika = loading#load in
  let pikachu =
    if first_pika#get_health > 5 && first_pika#get_hygiene > 5 && first_pika#get_energy > 5 && first_pika#get_happiness > 5 then first_pika
    else loading in

  Utils.draw_all pikachu "";
  try
    main_loop (Sys.time ()) pikachu (Graphics.button_down ())
  with
  | Graphics.Graphic_failure("fatal I/O error") -> print_endline "Goodbye !"
  | Sys_error e -> prerr_endline ("Error : "^e)
  | _ -> prerr_endline "Unknown Error"
