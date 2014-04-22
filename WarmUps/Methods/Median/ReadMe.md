# WarmUp
## Median Finding

In a list of numbers a median is the number at the middle position of the sorted array of numbers.

For example:

    my_arr = [2,4,3,7,6,5,1]
    median(my_arr) # => 4

The median of `[2,4,3,7,6,5,1]` is `4` because `4` is in the middle position of `[1,2,3,4,5,6,7]`.

## Directions

* Implement a `median` method that takes one array argument and returns the median of the array.
* Don't use any built in sorting methods. Implement a sorting method if you choose to use one. (Note: this might be a good time to try to implement merge-sort or even try to re-implement bubble sort, and feel free to copy your `merge` method from last week if implementing `merge_sort`).

### Applications
The median has many applications like Median Filtering for images, removing black and white speckles from images,

  <img src="http://tracer.lcc.uma.es/problems/mfp/MFExample.jpg">

because the median is much less sensitive to outlier values, i.e. in a list `[1,1,1,1,100000]` the median is `1` but the average is `25000`.