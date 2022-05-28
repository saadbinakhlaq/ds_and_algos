=begin
T1=[(0,0), (5,2), (10,0)]
T2=[(0,0), (3,1), (7,10), (12,0)]
final = [(0,0), (3,1), (5, 3), (7, 12), (10, 10), (12,0)]
=end

def final_cumulative(t1, t2)
  final_array = []
  time_1 = 0
  time_2 = 0
  last_t1_val = 0
  last_t2_val = 0
  if t1[0][0] < t2[0][0]
    final_array << t1
    last_t1_val = t1[0][1]
    time_1 += 1
  elsif t2[0][0] < t1[0][0]
    final_array << t2
    last_t2_val = t2[0][1]
    time_2 += 1
  else
    last_t1_val = t1[0][1]
    last_t2_val = t2[0][1]
    final_array << [t1[0][0], last_t1_val + last_t2_val]
    time_1 += 1
    time_2 += 1
  end
  final_value = 0

  while !t1[time_1].nil? && !t2[time_2].nil?
    if t1[time_1][0] < t2[time_2][0]
      final_value = t1[time_1][1] + last_t2_val
      if final_array.last[1] != final_value
        final_array << [t1[time_1][0], final_value]
      end
      last_t1_val = t1[time_1][1]
      time_1 += 1
      
    elsif t2[time_2][0] < t1[time_1][0]
      final_value = t2[time_2][1] + last_t1_val
      if final_array.last[1] != final_value
        final_array << [t2[time_2][0], final_value]
      end
      last_t2_val = t2[time_2][1]
      time_2 += 1
      
    else
      final_value = t1[time_1][1] + t2[time_2][1]
      final_array << [t1[time_1][0], final_value]
      last_t1_val = t1[time_1][1]
      last_t2_val = t2[time_2][1]
      time_1 += 1
      time_2 += 1
    end    
  end

  if !t1[time_1].nil?
    while !t1[time_1].nil?
      final_value = t1[time_1][1] + last_t2_val
      final_array << [t1[time_1][0], final_value]
      time_1 += 1
    end
  end

  if !t2[time_2].nil?
    while !t2[time_2].nil?
      final_value = last_t1_val + time_2[time_2][1]
      final_array << [t2[time_2][0], final_value]
      time_2 += 1
    end
  end
  final_array
end

t1 = [[0, 0], [5, 2], [10, 0]]
t2 = [[0,0], [3, 1], [7, 10], [12, 0]]
p final_cumulative(t1, t2)