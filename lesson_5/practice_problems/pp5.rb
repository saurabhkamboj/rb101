munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0

munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end

# alternate
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end
