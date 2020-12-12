#!/usr/bin/ruby

boarding_passes = File.read(__dir__ + '/boarding_passes.txt').split(/\n/)

rows = (0..127).to_a
columns = (0..7).to_a
seats = []
boarding_passes.each do |boarding_pass|
  row ||= rows
  column ||= columns

  boarding_pass.split(//).take(7).each do |instruction|
    case instruction
    when 'F'
      row = row.first((row.count / 2))
    when 'B'
      row = row.last((row.count / 2))
    end
  end

  boarding_pass.split(//).last(3).each do |instruction|
    case instruction
    when 'L'
      column = column.first((column.count / 2))
    when 'R'
      column = column.last((column.count / 2))
    end
  end

  seat_id = row.first * 8 + column.first

  seats.push seat_id
  puts "#{boarding_pass} - #{row} - #{column} - #{seat_id}"
end

# puts seats.sort

available_seats = (59..904).to_a

puts available_seats - seats

# puts seats.max
