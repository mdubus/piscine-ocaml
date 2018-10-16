(****************** WINDOW ******************)

type window_utils = {
  width:int;
  height:int
}

let window = {
  width = 1000;
  height = 800
}

(****************** READ IMAGES ******************)

let read_image_ppm name =
  let file_open = open_in_bin name in
  let first_line = input_line file_open
  in let (largeur,longueur) =
       let rec loop line =
         if (line.[0] = '#')
         then loop (input_line file_open)
         else line
       in
       match String.split_on_char ' ' ( loop (input_line file_open) ) with
       | head::second::[] -> (int_of_string head , int_of_string second)
       | _ -> failwith ("couldn't parse line")
  and _ = input_line file_open
  in
  let img = Array.make_matrix longueur largeur (Graphics.rgb 0 0 0)
  and bool_color = (first_line = "P6")
  in
  let rec loop_longueur i =
    if (longueur  > i) then
      let rec loop_largeur j =
        if (largeur  > j) then
          ((
            img.(i).(j) <-
              if bool_color then
                let x = input_byte file_open
                and y = input_byte file_open
                and z = input_byte file_open
                in Graphics.rgb x y z
              else
                let x = input_byte file_open
                in  Graphics.rgb x x x
          );
           loop_largeur (j+1))
      in begin loop_largeur 0 ; loop_longueur (i + 1) end
  in loop_longueur 0 ;
  close_in file_open ;
  img

let safe_read_image_ppm name =
  try
    read_image_ppm name
  with
  | Sys_error err -> prerr_endline ("Error: Image: " ^ err); exit 1
  | _             -> prerr_endline "Error: unknown error"; exit 1


(****************** PICTURES ******************)

  let xeat = 200
  let xbath = 350
  let xthunder = 500
  let xkill = 650

  let buttonsy = 150
  let widthbuttons = 100
  let heightbuttons = 50

  let play_again_y = 100
  let play_again_x = (window.width - 150) / 2
  let play_again_width = 150

  let pikachu_eat = safe_read_image_ppm "images/pikachu-eat.ppm"
  let pikachu_bath = safe_read_image_ppm "images/pikachu-bath.ppm"
  let pikachu_thunder = safe_read_image_ppm "images/pikachu-thunder.ppm"
  let pikachu_kill = safe_read_image_ppm "images/pikachu-kill.ppm"
  let pikachu_dead = safe_read_image_ppm "images/pikachu-fainted.ppm"
  let pikachu_standard = safe_read_image_ppm "images/pikachu.ppm"

  let get_image action =
    match action with
    | "Eat" -> pikachu_eat
    | "Bath" -> pikachu_bath
    | "Thunder" -> pikachu_thunder
    | "Kill" -> pikachu_kill
    | "Dead" -> pikachu_dead
    | _ -> pikachu_standard

(****************** UTILS ******************)

let draw_button x y width height s =
  Graphics.moveto x y;
  Graphics.lineto (x + width) y;
  Graphics.lineto (x + width) (y - height);
  Graphics.lineto x (y - height);
  Graphics.lineto x y;
  let (tx, ty) = Graphics.text_size s in
  Graphics.moveto (x + ((width - tx) / 2)) (y - ((height + ty) / 2));
  Graphics.draw_string s

let draw_all tama action=
  Graphics.clear_graph();
  let (tx, ty) = Graphics.text_size (tama#to_string) in
  Graphics.moveto ((window.width - tx) / 2) (window.height - 100);
  Graphics.draw_string tama#to_string;
  Graphics.draw_image (Graphics.make_image (get_image action)) 300 200;
  draw_button xeat buttonsy widthbuttons heightbuttons "EAT";
  draw_button xthunder buttonsy widthbuttons heightbuttons "THUNDER";
  draw_button xbath buttonsy widthbuttons heightbuttons "BATH";
  draw_button xkill buttonsy widthbuttons heightbuttons "KILL";
  Graphics.synchronize ()

let draw_changes tama =
  let (tx, ty) = Graphics.text_size (tama#to_string) in
  Graphics.set_color Graphics.white;
  Graphics.fill_rect 0 (window.height - 100) window.width ty;
  Graphics.moveto ((window.width - tx) / 2) (window.height - 100);
  Graphics.set_color Graphics.black;
  Graphics.draw_string tama#to_string;
  Graphics.synchronize ()

let rec wait_until_change time tama =
  if (Sys.time () -. time) >= 1.5 then draw_all tama ""
  else wait_until_change time tama

let dispatch_action loop time tama =
  let (x, y) = Graphics.mouse_pos() in
  if y >= (buttonsy - heightbuttons) && y <= buttonsy then
    match x with
    | x when x >= xeat && x <= (xeat + widthbuttons) ->
      begin
        draw_all tama "Eat";
        wait_until_change (Sys.time ()) tama;
        loop time tama#eat (Graphics.button_down ());
      end
    | x when x >= xthunder && x <= (xthunder + widthbuttons) ->
      begin
        draw_all tama "Thunder";
        wait_until_change (Sys.time ()) tama;
        loop time tama#thunder (Graphics.button_down ());
      end
    | x when x >= xbath && x <= (xbath + widthbuttons) ->
      begin
        draw_all tama "Bath";
        wait_until_change (Sys.time ()) tama;
        loop time tama#bath (Graphics.button_down ());
      end
    | x when x >= xkill && x <= (xkill + widthbuttons) ->
      begin
        draw_all tama "Kill";
        wait_until_change (Sys.time ()) tama;
        loop time tama#kill (Graphics.button_down ());
      end
    | _ -> loop time tama (Graphics.button_down ())
  else loop time tama (Graphics.button_down ())

let save tama =
  let oc = open_out "save.itama" in
  let output_endline out str =
    output_string out str;
    output_string out "\n"
  in

  begin try
      output_endline oc (string_of_int tama#get_health);
      output_endline oc (string_of_int tama#get_hygiene);
      output_endline oc (string_of_int tama#get_energy);
      output_endline oc (string_of_int tama#get_happiness);
    with
    | Sys_error err -> print_string "impossible save : "; print_endline err
    | End_of_file   -> close_out oc
    | _             -> prerr_endline "Error: unknown error"; exit 1
  end
