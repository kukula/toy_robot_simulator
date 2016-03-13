module ToyRobotSimulator
  class Controller
    TURNS = %w(RIGHT LEFT)

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def perform(user_command)
      command, arguments = user_command.split
      case command
      when *TURNS
        bot.turn command.downcase.to_sym
      when "MOVE"
        bot.move
        true
      when "REPORT"
        puts bot.inspect.upcase
        true
      when "PLACE"
        place(command, arguments)
      else
        false
      end
    end

    private

    def place(command, arguments)
      return false if arguments.nil?
      args = arguments.split(",")
      return false if args.count < 3
      bot.place args[0].to_i, args[1].to_i, args[2].downcase.to_sym
    end
  end
end
