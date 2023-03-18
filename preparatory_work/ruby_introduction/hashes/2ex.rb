# 'merge!' uses the bang suffix (!) which makes a change destructive whereas 'merge' returns a new merged hash and leaves the original hash unmodified

person = { name: "Saurabh" }
age = { age: 23 }

person.merge(age)
puts person
puts age

person.merge!(age)
puts person
puts age