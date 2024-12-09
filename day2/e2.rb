
def is_good(input)
  sorted = input.sort
  safe = true
  if input == sorted || input.reverse == sorted
    for i in 0..sorted.length() - 2 do
      diff = sorted[i+1] - sorted[i]
      if diff < 1 || diff > 3
        safe = false
        break
      end
    end
  else
    safe = false
  end
  return safe
end



input_file_path = "input.txt"

input = File.read(input_file_path)

lines = input.split("\n")
count = 0
lines.each_with_index do |value, index|
  line_as_ints = value.split(" ").map(&:to_i)
  safe = is_good(line_as_ints)
  if safe
    count += 1
  else
    for i in 0..line_as_ints.length()
      cp = line_as_ints.clone     
      cp.delete_at(i)
      if is_good(cp)
        count += 1
        break
      end
    end
  end
end
puts count



