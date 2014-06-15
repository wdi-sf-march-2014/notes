# Warm Up
## Flatten

In Ruby we know that we can keep composing arrays as much as we'd like. For example, the following is a valid array in Ruby

```
[1,2,[3,4],[5,[6]]]
```

but you can imagine a case when you'd like to flatten array, decompose it into just an array of elements, so

```
[1,2,[3,4],[5,[6]]]
```

would become

```
[1,2,3,4,5,6]
```


Complete the method below that flattens an array

`flatten.rb`

```
my_arr

def flatten(arr)
  # your code here
end


# writes [1,2,3,4,5,6] to console
p flatten(my_arr)

```
NOTE: You may want worry about "what" your elements *are* in the array.
