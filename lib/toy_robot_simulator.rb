require "toy_robot_simulator/version"
require "toy_robot_simulator/bot"
require "toy_robot_simulator/controller"

module ToyRobotSimulator
  def self.run(file)
    bot = Bot.new
    controller = Controller.new(bot)
    file.read.each_line do |command|
      controller.perform(command)
    end
  end
end
