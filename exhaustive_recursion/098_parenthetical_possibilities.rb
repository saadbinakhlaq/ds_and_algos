=begin
Write a function, parenthetical_possibilities, that takes in a string as an argument. The function should return an array containing all of the strings that could be generated by expanding all parentheses of the string into its possibilities.

For example, the possibilities for 'x(mn)yz' are 'xmyz', 'xnyz'.
=end

# get_choices('(abc)d') -> ['abc', 'd']
# get_choices('a(bc)d') -> ['a', '(bc)d']

def get_choices(string)
  if string[0] == '('
    idx = string.index(')')
    return [string[1...idx], string[(idx + 1)...string.size]]
  else
    return [string[0], string[1...string.size]]
  end
end

def parenthetical_possibilities(string)
  return [''] if string.size == 0

  all_possibilities = []

  choices, remainder = get_choices(string)

  choices.each_char do |choice|
    remainder_possibilities = parenthetical_possibilities(remainder)

    remainder_possibilities.each do |possibility|
      all_possibilities << choice + possibility
    end
  end

  all_possibilities
end

p parenthetical_possibilities('x(mn)yz')
p parenthetical_possibilities("(qr)ab(stu)c")