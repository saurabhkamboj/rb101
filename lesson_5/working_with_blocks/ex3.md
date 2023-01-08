# Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

| Line | Action | Object | Side-Effect | Return value | Is returned value used? |
| --- | --- | --- | --- | --- | --- |
| 1 | method call `map` | The outter array | None | New array `[1, 3]` | No |
| 1-4 | block execution | Each inner array | None | Element at index [0] of each inner array | Yes, used by `map` for transformation |
| 2 | method call `first` | Each inner array | None | Element at index [0] of inner array | Yes, used by `puts` |
| 2 | method call `puts` | Element at index [0] of each inner array | Outputs the string representation of the integer | `nil` | No
| 3 | method call `first` | Each inner array | None | Element at index [0] of inner array | Yes, used to determine the return value of the block |
