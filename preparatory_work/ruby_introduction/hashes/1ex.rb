family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

immediate_family = family.select do |relation, names| 
  (relation == :sisters) || (relation == :brothers)
end

array = immediate_family.values.flatten