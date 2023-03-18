def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# the method parameter block is missing ampersand sign &