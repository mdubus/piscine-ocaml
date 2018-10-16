class pikachu (health:int) (hygiene:int) (energy:int) (happiness:int) =
  object (self)
    inherit Tama.tama health hygiene energy happiness "Pikachu"

    method eat = new pikachu (self#format_value (health+25)) (self#format_value (hygiene-20)) (self#format_value (energy-10)) (self#format_value (happiness+5))
    method thunder = new pikachu (self#format_value (health-20)) (self#format_value (hygiene)) (self#format_value (energy+25)) (self#format_value (happiness-20))
    method bath = new pikachu (self#format_value (health-20)) (self#format_value (hygiene+25)) (self#format_value (energy-10)) (self#format_value (happiness+5))
    method kill = new pikachu (self#format_value (health-20)) (self#format_value (hygiene)) (self#format_value (energy-10)) (self#format_value (happiness+20))
    method loose_life = new pikachu (self#format_value (health-1)) (self#format_value (hygiene)) (self#format_value (energy)) (self#format_value (happiness))
    method get_new = new pikachu 100 100 100 100


    (****************** UTILS ******************)

    method die i =
      if i < 1 then Graphics.clear_graph();
      Graphics.draw_image (Graphics.make_image (Utils.get_image "Dead")) 0 100;
      Graphics.moveto 700 300;
      Graphics.draw_string "you died bro";
      Graphics.synchronize ();
      if i < 100 then self#die (i + 1)

    method load =
      begin try
          let ic = open_in "save.itama" in
          let hea = int_of_string (input_line ic) in
          let hyg = int_of_string (input_line ic) in
          let ene = int_of_string (input_line ic) in
          let hap = int_of_string (input_line ic) in
          close_in ic;
          new pikachu hea hyg ene hap
        with
        | Sys_error err -> print_string "impossible loading : ";print_endline err; new pikachu self#get_health self#get_hygiene self#get_energy self#get_happiness
        | _             -> print_endline "impossible loading : "; new pikachu self#get_health self#get_hygiene self#get_energy self#get_happiness
      end

  end
