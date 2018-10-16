
class virtual tama health hygiene energy happiness name =
  object (self)
    val _health:int = health
    val _hygiene:int = hygiene
    val _energy:int = energy
    val _happiness:int = happiness
    val _name:string = name

    method format_value x =
      match x with
      | x when x < 0 -> 0
      | x when x > 100 -> 100
      | _ -> x

    method get_health = self#format_value _health
    method get_hygiene = self#format_value _hygiene
    method get_energy = self#format_value _energy
    method get_happiness = self#format_value _happiness
    method get_name = _name
    method is_dead = _health < 1 || _hygiene < 1 || _energy < 1 || _happiness < 1
    method to_string = _name^
                       " Health: "^(string_of_int self#get_health)^
                       "      Hygiene: "^(string_of_int self#get_hygiene)^
                       "      Energy: "^(string_of_int self#get_energy)^
                       "      happiness: "^(string_of_int self#get_happiness)

  end
