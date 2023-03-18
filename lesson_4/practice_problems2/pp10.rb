munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

munsters.each do |key, values|
  case values["age"]
  when 0...18
    values["age_group"] = "kid"
  when 18...65
    values["age_group"] = "adult"
  else
    values["age_group"] = "senior"
  end
end
