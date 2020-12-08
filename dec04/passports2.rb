#!/usr/bin/ruby

passports = File.read(__dir__ + "/passports.txt").split(/\n\n/)

required_fields = %w(byr iyr eyr hgt hcl ecl pid)


validations = {
  "byr" => /(19[2-8][0-9]|199[0-9]|200[0-2])/,
  "iyr" => /(201[0-9]|2020)$/,
  "eyr" => /(202[0-9]|2030)$/,
  "hgt" => /^(59|6[0-9]|7[0-6])in|(15[0-9]|16[0-9]|17[0-9]|18[0-9]|19[0-3])cm$/,
  "hcl" => /^#[0-9a-f]{6}$/,
  "ecl" => /^amb|blu|brn|gry|grn|hzl|oth$/,
  "pid" => /^[0-9]{9}$/,

}
optional = ['cid']

valid_passports = []

passports.each do |passport|
  passport.sub!(/\n/, " ")

  keyvals = passport.split(/\s/)

  keys = []
  errors = keyvals.map do |data_point|
    key, val = data_point.split(":")
    keys.push key
    next if optional.include? key
    "err #{key} #{val}" unless val.match validations[key]
  end

  puts errors
  next unless errors.compact.count == 0
  valid_passports.push passport if required_fields.all? {|rq| keys.include?(rq)}
end

puts valid_passports
puts valid_passports.count

