=begin
Write a function, create_combinations, that takes in a list and a length as arguments. The function should return a 2D list representing all of the combinations of the specifized length.

The items within the combinations and the combinations themselves may be returned in any order.

You may assume that the input list contains unique elements and 1 <= k <= len(items).

create_combinations([q, r, s, t], 3)

                                          [q, r, s, t]
                                              /       \
                                            /          \
                                          /             \
            create_combinations([r, s, t], k - 1)      create_combinations([r, s, t], k)
        then add first element to all the items of
        the array
=end

def create_combinations(items, k)
  return [[]] if k == 0
  return [] if items.size < k

  first = items[0]
  combinations_with_first = []
  create_combinations(items[1...items.size], k - 1).each do |combo|
    combinations_with_first << [first, *combo]
  end

  combinations_without_first = create_combinations(items[1...items.size], k)

  combinations_without_first + combinations_with_first
end

p create_combinations(["a", "b", "c"], 2)