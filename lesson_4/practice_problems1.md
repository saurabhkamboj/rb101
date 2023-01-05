# Practice Problems: Methods and more Methods

1. The return value of the block will be 'hi' which is truthy therefore 'select' will return a new array `=> [1, 2, 3]`

2. According to the ruby documentation here <https://ruby-doc.org/core-2.7.5/Enumerable.html#method-i-count> `Enumerable#count` returns the number of items in an enum. If an argument or a block is given, then the number of items that are equal to the argument or the block are returned. In the case of stated problem `count` will return `=> 2`. Answer by LS; returns the count of elements for which the block returns a truthy value

3. `=> [1, 2, 3]`, because 'reject' returns a new array containing elements whose return value is 'falsey'.

4. `{ "a" => "ant", "b" => "bear", "c" => "cat" }`, because we passed `({})` as an argument when we invoked `each_with_object`, the empty Hash was then passed into the block and its updated value was returned.

5. `shift`, removes the first key-value pair from the `hash` and returns it as a two item array, in this case it returns `=> [:a, "ant"]`, we can find this in the ruby documentation here <https://ruby-doc.org/core-2.7.5/Hash.html#method-i-shift>.

6. `=> 11`, `Array#pop` is first called on the array which removed the last element from the array and returned it, it then called `String#size` on the value returned by 'pop'. which returns the number of chracters in that string.

7. `=> true`, because return value of the block is determined by the return value of the last expression. 'any' returns a boolean; `=> true` and output of the code is `1`.

8. `take` returns the first n elments of the array. It is not destructive. We can find how the method works here <https://ruby-doc.org/core-2.7.5/Array.html#method-i-take>

9. `=> [nil, 'bear']`. From LS; There are some interesting things to point out here. First, the return value of map is an array, which is the collection type that map always returns. Second, where did that nil come from? If we look at the if condition (value.size > 3), we'll notice that it evaluates as true when the length of value is greater than 3. In this case, the only value with a length greater than 3 is 'bear'. This means that for the first element, 'ant', the condition evaluates as false and value isn't returned.

    When none of the conditions in an if statement evaluates as true, the if statement itself returns nil. That's why we see nil as the first element in the returned array.

10. `=> [1, nil, nil]`, the return value of the block is determined by the return value of the last expresson. In this case the return value of the if statement on the first iteration is false, therefore it returns 'num', for the other iterations the elements satistfy the if statement condition of num > 1 therefore the return value is `nil`. From LS; For the rest of the elements in the array, num > 1 evaluates as true, which means `puts num` is the last statement evaluated, which in turn, means that the block's return value is nil for those iterations.
