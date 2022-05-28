def valid_palindrome(string)
  i = 0
  j = string.size - 1
  
  while i < j
    return false if string[i] != string[j]
    i += 1
    j -= 1
  end
  true
end

def valid_palindrome_2(string)
  i = 0
  j = string.size - 1

  while i < j
    if string[i] != string[j]
      return valid_palindrome(string[i+1..j]) || valid_palindrome(string[i..j - 1])
    end
    i += 1
    j -= 1
  end
  return true
end

