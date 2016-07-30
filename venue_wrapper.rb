require "colorize"

def start_wrapper()
  system "clear"
  puts " Welcome to CodeClan Caraoke ".black.on_yellow
  options()
end

def options()
  puts "Here are options:".yellow
  gets.chomp
end

start_wrapper()