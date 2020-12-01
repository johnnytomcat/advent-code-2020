#!/usr/bin/ruby


a = File.read(__dir__ + "/numbers.txt").split.map(&:to_i)

matching_sum = 2020

matching_numbers = []

a.each do |n1|
	a.each do |n2|
    matching_numbers.push ([n1, n2]) if n1 + n2 == matching_sum
	end
end

puts "PuZZLE 1"
puts matching_numbers.flatten.uniq.reduce(:*)

matching_numbers = []
a.each do |n1|
	a.each do |n2|
		a.each do |n3|
			matching_numbers.push ([n1, n2, n3]) if n1 + n2 + n3 == matching_sum
		end
	end
end

puts "\nPuZZLE 2"
puts matching_numbers.flatten.uniq.reduce(:*)