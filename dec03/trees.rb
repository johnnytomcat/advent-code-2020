#!/usr/bin/ruby

mountain = File.read(__dir__ + "/mountain.txt").split(/\n/)

def count_trees mountain, slope_path, char_count
  right_pos = 1
  next_row = slope_path[:down]
  trees = []
  mountain.each_with_index do |row, i|
    next if i < next_row

    right_pos += slope_path[:right]
    right_pos = right_pos - char_count if right_pos >= char_count


    coords = row.split('')
    trees.push coords[right_pos-1] if coords[right_pos-1] == "#"
    next_row += slope_path[:down]
  end

  trees.count
end


char_count = 31
slope_path = {
  right: 3,
  down:1
}

puts "PUZZLE 1"
puts count_trees(mountain, slope_path, char_count)


puts "PUZZLE 2"

path_one = count_trees(mountain, {
  right: 1,
  down:1
}, char_count)

path_two = count_trees(mountain, {
  right: 3,
  down:1
}, char_count)

path_three = count_trees(mountain, {
  right: 5,
  down:1
}, char_count)

path_four = count_trees(mountain, {
  right: 7,
  down:1
}, char_count)

path_five = count_trees(mountain, {
  right: 1,
  down:2
}, char_count)


total_trees = path_one * path_two * path_three *path_four * path_five
puts total_trees
