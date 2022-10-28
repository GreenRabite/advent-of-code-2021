require 'csv'


inputs = []
CSV.foreach("./input.txt") do |row|
  inputs << row
end

larger_measurements = inputs.flatten!.each_with_index.reduce(0) do |count, (depth, idx)|
  next count if idx == 0

  count += 1 if depth.to_i > inputs[idx-1].to_i
  count
end

puts larger_measurements

windows_array = inputs.each_with_index.reduce([]) do |windows, (depth, idx)|
  next windows if !inputs[idx +1] && !inputs[idx + 2]

  windows <<  depth.to_i + inputs[idx+1].to_i + inputs[idx+2].to_i
  windows
end


larger_windows = windows_array.each_with_index.reduce(0) do |bigger_windows, (window_size,idx)|
  next bigger_windows if idx == 0 
  
  bigger_windows += 1 if  window_size.to_i > windows_array[idx - 1].to_i
  bigger_windows
end

puts larger_windows

