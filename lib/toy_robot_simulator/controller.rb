module ToyRobotSimulator
  class Controller
    DIRECTIONS = %w(NORTH SOUTH EAST WEST)

    attr_reader :bot, :command, :arguments

    def initialize(bot, initial_command)
      @bot = bot
      @command, @arguments = initial_command.split
    end

    def perform
      case command
      when *DIRECTIONS
        bot.direction = command.downcase.to_sym
      when "MOVE"
        bot.move
        true
      when "REPORT"
        bot.inspect.upcase
      when "PLACE"
        place
      else
        false
      end
    end

    private

    def place
      return false if arguments.nil?
      args = arguments.split(",")
      return false unless args.count == 3
      bot.place args[0].to_i, args[1].to_i, args[2].downcase.to_sym
    end
  end
end
