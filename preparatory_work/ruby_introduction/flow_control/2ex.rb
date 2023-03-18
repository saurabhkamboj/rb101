def caps(s)
  if s.length > 10
    s.upcase
  else
    s
  end
end

puts caps("This is a long sentence")
puts caps("Short")