arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

1. arr.delete_if { |x| x.start_with?("s") }

2. arr.delete_if { |x| x.start_with?("s", "w") }