module ToyRobotSimulator
  class Controller
    DIRECTIONS = %w(NORTH SOUTH EAST WEST)

    attr_reader :bot, :command, :args, :valid

    def initialize(bot, initial_command)
      @bot = bot
      @command, args = initial_command.split
      @args = args.split(",") unless args.nil?
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
      else
        false
      end
    end
  end
end
