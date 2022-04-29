#!/usr/bin/env ruby
# frozen_string_literal: true

def evalmath(str)
  raise "Inexpected input: #{str}" unless str =~ /^[\d\-+,. ]+$/

  # Too lazy, hacking time...
  str = str.gsub(",", "")
  eval(str)
end

def handle_line(line)
  output = evalmath(line)
  puts output
  puts (output.to_f / 1000.0).round(3)
end

loop do
  print "> "
  input = gets
  exit unless input
  line = input.chomp
  handle_line(line)
rescue Interrupt
  warn "Got Ctrl+C, exitting"
  exit 0
end
