# Example 5

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

| Line | Action | Object | Side-Effect | Return value | Is returned value used? |
| --- | --- | --- | --- | --- | --- |
| 1 | method call `map` | `[[1, 2],[3, 4]]` | None  | New transformed array | No |
| 1-5 | block execution | Each sub-array | None | New transformed sub-arrays | Yes, used  by `map` for transofmration |
| 2 | method call `map` | Each sub-array | None | New tranformed sub-arrays | Yes, used by the outter block to determine return value |
| 2-4 | block execution | Each current element within the sub-arrays | None | An integer | Used by inner map for transformation |
| 3 | method call `*` | Each current element within the sub-arrays | None | An integer | Used to determine the return value of the inner block |
