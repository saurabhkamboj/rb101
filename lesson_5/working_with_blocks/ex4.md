# Example 4

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

| Line | Action | Object | Side-Effect | Return value | Is returned value used? |
| --- | --- | --- | --- | --- | --- |
| 1 | New local variable `my_arr` is initiated pointing to the return value of `each` method | `[[18, 7],[3, 12]]` | None | `[[18, 7],[3, 12]]` | No |
| 1 | method call 'each` | Outter array | None | Outter array | Yes |
| 1-7 | block execution | Each inner array | None | Each inner array | No |
| 2 | method call `each` | Each inner array | None | The current inner array | Yes, used to determine the return value of the outter block |
| 2-6 | block execution | Each current element of the inner array in each execution | None | `nil` | No
| 3 | comparison `>` | Each current element of each inner array | None | Boolean | Yes |
| 3-5 | conditional `if` | Each current element of each inner array | None | `nil` | Yes, used to determine the return value of the inner block |
| 4 | method call `puts` | Each current element that satisfies the comparion | Outputs the string representation of integer | `nil` | Yes, used to determine the return value of the if statement |
