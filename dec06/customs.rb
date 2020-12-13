#!/usr/bin/ruby

groups = File.read(__dir__ + '/test.txt').split(/\n\n/)

count = 0
groups.each do |group|
  count += group.gsub(/\n/, '').split(//).uniq.count
end
puts 'Puzzle 1'
puts count
