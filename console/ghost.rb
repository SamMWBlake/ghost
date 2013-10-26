require 'readline'
require_relative File.join "..", "test", "game"

game = test_game

puts
puts game.start
puts

begin
  while input = Readline.readline("> ", true).downcase
    # Delete history entry if input is all whitespace
    Readline::HISTORY.pop if /^\s*$/ =~ input

    # Delete history entry if input is the same as the previous input
    if Readline::HISTORY.length > 2 and Readline::HISTORY[Readline::HISTORY.length - 2] == input
      Readline::HISTORY.pop
    end

    # Output result
    puts
    result = game.execute input
    puts result
    puts
    if result.endgame
      exit
    end
  end
rescue Interrupt => e
  exit
end
