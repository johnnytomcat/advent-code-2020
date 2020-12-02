#!/usr/bin/ruby

policies = File.read(__dir__ + "/policies.txt").split(/\n/)

valid_passwords = []
policies.each do |policy|
	req, char, pass = policy.split(/\s/)
	char.sub!(":","")
	min, max = req.split("-")
	occurrence = pass.count(char)

	next unless occurrence >= min.to_i
	next unless occurrence <= max.to_i

	valid_passwords.push policy
end

puts "PUZZLE 1"
puts valid_passwords.count


valid_passwords = []
policies.each do |policy|
	req, char, pass = policy.split(/\s/)
	char.sub!(":","")
	pos_one, pos_two = req.split("-")
	occurrences = pass.split('')
	match_one = occurrences[pos_one.to_i - 1] == char
	match_two = occurrences[pos_two.to_i - 1] == char

	next if occurrences.count == 0
	next unless match_one || match_two
	next if match_one && match_two

	valid_passwords.push policy
end

puts "PUZZLE 2"
puts valid_passwords.count
