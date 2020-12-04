#!/usr/bin/ruby

passports = File.read(__dir__ + "/passports.txt").split(/\n\n/)

required_fields = %w(byr iyr eyr hgt hcl ecl pid)
optional = ['cid']

valid_passports = []

passports.each do |passport|
  passport.sub!(/\n/, " ")

  keyvals = passport.split(/\s/)

  keys = []
  keyvals.map do |data_point|
    key, val = data_point.split(":")
    keys.push key
  end
  valid_passports.push passport  if required_fields.all? {|rq| keys.include?(rq)}
end

puts valid_passports
puts valid_passports.count

