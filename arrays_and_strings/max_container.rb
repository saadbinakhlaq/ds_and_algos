=begin
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.
=end

def max_container(height)
  index_1 = 0
  index_2 = height.size - 1

  max_volume = 0

  while index_1 < index_2
    min_height = [height[index_1], height[index_2]].min
    base = index_2 - index_1
    volume = min_height * base
    max_volume = [max_volume, volume].max

    if height[index_2] < height[index_1] # key approach is to move the pointer with lower height, because we cannot do any better than that
      index_2 -= 1
    else
      index_1 += 1
    end
  end
  max_volume
end

puts max_container [1,8,6,2,5,4,8,3,7]