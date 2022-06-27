# require 'byebug'
# require 'set'

# class Node
#   attr_accessor :left, :right, :val
#   def initialize(val)
#     @val = val
#     @left = nil
#     @right = nil
#   end
# end

# # [6,2,8,0,4,7,9,null,null,3,5]

# a = Node.new(6)
# b = Node.new(2)
# c = Node.new(8)
# d = Node.new(0)
# e = Node.new(4)
# f = Node.new(7)
# g = Node.new(9)
# h = Node.new(3)
# i = Node.new(5)

# =begin
#             6
#           /   \
#         2      8
#       /  \    / \
#     0    4   7  9
#         / \
#        3  5
# =end

# a.left = b
# a.right = c
# b.left = d
# b.right = e
# e.left = h
# e.right = i
# c.left = f
# c.right = g

# def path_finder(root, target)
#   return nil if root.nil?
#   return [root.val] if root.val == target

#   left_path = path_finder(root.left, target)
#   return [*left_path, root.val] if !left_path.nil?

#   right_path = path_finder(root.right, target)
#   return [*right_path, root.val] if !right_path.nil?

#   return nil
# end

# def lowest_common_ancestor(root, p, q)
#   path_p = path_finder(root, p.val)
#   path_q = path_finder(root, q.val)
  
#   set_2 = Set.new(path_q)
#   p path_p
#   p path_q

#   path_p.each do |path|
#     return path if set_2.include?(path)
#   end
# end

# p lowest_common_ancestor(a, b, e)
require 'set'

# def build_graph(num_courses, prerequisites)
#   graph = {}
#   (0...num_courses).each do |index|
#     graph[index] = []
#   end
  
#   prerequisites.each do |prereq|
#     course_1, course_2 = prereq
    
#     graph[course_2] << course_1
#   end
  
#   graph
# end
require 'byebug'

# def create_new_string(str)
#   "#{str.size}##{str}"
# end

# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#       @val = val
#       @left = nil
#       @right = nil
#   end
# end

# def build_in_pre_order(root)
#   if root.nil?
#     return []
#   end
  
#   [ root.val, *build_in_pre_order(root.left), *build_in_pre_order(root.right)]
# end

# def build_in_in_order(root)
#   if root.nil?
#     return []
#   end

#   [*build_in_in_order(root.left), root.val, *build_in_in_order(root.right)]
# end

# def build_tree_in_pre_order(in_order, pre_order)
#   if in_order.size == 0
#     return nil
#   end

#   val = pre_order[0]
#   root = TreeNode.new(val)
#   mid = in_order.index(val)
#   left_in_order = in_order[...mid]
#   right_in_order = in_order[(mid + 1)...]

#   left_pre_order = pre_order[1...(left_in_order.size + 1)]
#   right_pre_order = pre_order[(left_in_order.size + 1)...]
#   root.left = build_tree_in_pre_order(left_in_order, left_pre_order)
#   root.right = build_tree_in_pre_order(right_in_order, right_pre_order)
#   root
# end

# def serialize(root)
#   pre_order = build_in_pre_order(root)
#   in_order = build_in_in_order(root)
#   "#{pre_order.join(',')}|#{in_order.join(',')}"
# end

# def deserialize(data)
#   pre_order, in_order = data.split('|')
#   pre_order = pre_order.split(',').map(&:to_i)
#   in_order = in_order.split(',').map(&:to_i)
#   build_tree_in_pre_order(in_order, pre_order)
# end

# a = TreeNode.new(3)
# b = TreeNode.new(2)
# c = TreeNode.new(4)
# d = TreeNode.new(3)

# a.left = b
# a.right = c
# b.left = d

# # p deserialize(serialize(a))
# p serialize(a)
# # p serialize(nil)
# # deserialize(serialize([1,2,3,null,null,4,5]))
require 'byebug'
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

require 'byebug'


# def _combination_sum(candidates, target, index)
#   return [[]] if target == 0
#   return if index == candidates.size

#   candidate = candidates[index]
#   total_count = []

#   (0..(target / candidate)).each do |qty|
#     remainder = target - (qty * candidate)
#     _values = _combination_sum(candidates, remainder, index + 1)
#     next if _values.nil?
#     if _values.size > 0
#       _values.each do |_val|
#         total_count << [candidate] * qty + _val
#       end
#     end
#   end

#   total_count
# end

# def combination_sum(candidates, target)
#   _combination_sum(candidates, target, 0)
# end

# candidates = [2,3,5]
# target = 8
# p combination_sum(candidates, target)

# def erase_overlap_intervals(intervals)
#   byebug
#   intervals = intervals.sort_by { |interval| interval[0] }

#   non_overlap_intervals = [intervals[0]]
  
#   non_overlap_intervals = []
#   index = 1
#   total = 0
#   while index < intervals.size
#     if intervals[index][0] >= non_overlap_intervals.last[1]
#       non_overlap_intervals << interval[index]
#     else
#       total += 1
#       if non_overlap_intervals.last[1] > intervals[index][1]
#         non_overlap_intervals.pop
#         non_overlap_intervals << intervals[index]
#       end
#     end
#     index += 1
#   end
  
#   total
# end

# intervals = [[1,2],[2,3],[3,4],[1,3]]
# p erase_overlap_intervals intervals

# def character_replacement(string, k)
#   byebug
#   count = Hash.new do |h, k|
#     h[k] = 0
#   end
  
#   left = 0
#   right = 0
#   max_window = 0
#   while right < string.size
#     count[string[right]] += 1

#     max_element_in_window = count.values.max
    
#     # window valid?
#     while right - left + 1 - max_element_in_window > k
#       left += 1
#       count[string[left]] -= 1
#     end

#     max_window = [max_window, right - left + 1].max
#     right += 1
#   end
#   max_window
# end

# s = "AABABBA"
# k = 1
# p character_replacement s, k

# def count_substrings(string)
#   final_result = []
  
#   index = 0
  
#   while index < string.size
    
#     left = index
#     right = index
    
#     while left >= 0 && right < string.size && string[left] == string[right]
#       final_result << string[left...(right + 1)]
#       left -= 1
#       right += 1
#     end
    
#     left = index
#     right = index + 1
#     while left >= 0 && right < string.size && string[left] == string[right]
#       final_result << string[left...(right + 1)]
#       left -= 1
#       right += 1
#     end    
#   end
#   final_result
# end

# s = "abc"

# def length_of_lis(nums)
#   num_hash = Hash.new do |h, k|
#     h[k] = 1
#   end
#   # go from last index to 0
  
#   (nums.size - 1).step(0, -1).each do |idx|
#     ((idx + 1)...nums.size).each do |index_2|
#       if nums[idx] < nums[index_2]
#         num_hash[idx] = [num_hash[idx], 1 + num_hash[index_2]].max
#       end
#     end
#   end
  
#   if num_hash == {}
#     return 1
#   else
#     num_hash.values.max
#   end
# end

# nums = [7, 7, 7, 7]

# # nums = [1,3,6,7,9,4,10,5,6]
# p length_of_lis nums
require 'byebug'

def summing_squares(number)
  _summing_squares(number, {})
end

def _summing_squares(number, memo)
  if !memo[number].nil?
    return memo[number]
  end

  if number == 0
    return 0
  end

  min_squares = Float::INFINITY

  (1...(Math.sqrt(number).floor + 1)).each do |n|
    sq = n * n
    current = 1 + _summing_squares(number - sq, memo)
    min_squares = [min_squares, current].min
  end

  memo[number] = min_squares
end

p summing_squares(12)
