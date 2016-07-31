require "colorize"
require_relative "./venue"
require_relative "./room"
require_relative "./guest"

class VenueWrapper

  def initialize(venue)
    @selections = {
      help: {
        function: Proc.new {help_viewer()},
        description: "Opens this help viewer."
        },
      exit: {
        function: Proc.new {exit_wrapper()},
        description: "Exits the system."
        },
      view_rooms: {
        function: Proc.new {view_rooms()},
        description: "View a list of rooms and available capacities."
        },
      new_guest: {
        function: Proc.new {new_guest()},
        description: "Creates a new guest account."
        },
      clear: {
        function: Proc.new {clear_screen()},
        description: "Clears the screen."
      }
    }
    @venue = venue
    system "clear"
    puts " Welcome to CodeClan Caraoke ".black.on_yellow
    menu()
  end

  def menu()
    puts "Type 'help' for a list of available commands.".yellow
    puts "Please enter a command:".yellow
    user_selection()
  end

  def user_selection()
    print "> "
    input = gets.chomp
    input = convert_to_command(input)
    @selections[input][:function].call if @selections[input] != nil
    puts "Command not recognised. Please try again:".yellow
    user_selection()
  end

  def convert_to_command(input)
    input = input.downcase.split('')
    output = input.map do |char|
      if char == " "
        char = "_"
      else
        char
      end
    end
    return output.join.to_sym
  end

  def help_viewer()
    puts ""
    puts "Available commands:".green
    puts ""
    @selections.each do |command, info|
      puts "\t#{command}".green + ": #{info[:description]}".yellow
    end
    puts ""
    menu()
  end

  def view_rooms()
    puts ""
    @venue.rooms.each_with_index do |room, index|
      puts "Room #{index + 1} has a capacity of #{room.capacity}, with #{room.guests.count} guests:"
      room.guests.each do |guest|
        puts "\t#{guest.name}: £#{guest.cash}"
      end
      puts ""
    end
    menu()
  end

  def new_guest()
    puts ""
    puts "Please enter the guest's name:".yellow
    name = gets.chomp
    puts "How much to put on the guest's tab?".yellow
    tab = gets.chomp.to_i
    guest = Guest.new(name, tab)
    puts "Which room is the guest booking into?".yellow
    room = gets.chomp.to_i - 1
    puts @venue.check_in(guest, room)
    puts ""
    menu()
  end

  def clear_screen()
    system "clear"
    menu()
  end

  def exit_wrapper()
    puts ""
    puts "Thanks for using the CodeClan Caraoke system.".yellow
    abort("Bye!".yellow)
  end

end

room_of_10 = Room.new(10)
room_of_2 = Room.new(2)
codeclan = Venue.new([room_of_10, room_of_2])
VenueWrapper.new(codeclan)