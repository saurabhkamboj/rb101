family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

family.keys.each { |x| puts x }

family.values.each { |x| puts x }

family.each { |x, y| puts "#{y[0].capitalize}, #{y[1].capitalize}, and #{y[2].capitalize} are the #{x}." }