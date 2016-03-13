require 'spec_helper'

describe ToyRobotSimulator::Bot do
  describe "#valid?" do
    it "returns true if coordinates and direction are valid" do
      bot = ToyRobotSimulator::Bot.new(0, 0, "NORTH")
      expect(bot).to be_valid
    end

    it "returns false if coordinate x is out of tabletop" do
      bot = ToyRobotSimulator::Bot.new(-1, 0, "NORTH")
      expect(bot).not_to be_valid
    end

    it "returns false if coordinate y is out of tabletop" do
      y = ToyRobotSimulator::Bot::TABLETOP_HEIGHT + 1
      bot = ToyRobotSimulator::Bot.new(0, y, "NORTH")
      expect(bot).not_to be_valid
    end

    it "returns false if direction is not listed" do
      bot = ToyRobotSimulator::Bot.new(0, 0, "ONE")
      expect(bot).not_to be_valid
    end
  end

  describe "#direction=" do
    it "changes direction if new direction is valid" do
      bot = ToyRobotSimulator::Bot.new(0, 0, "NORTH")
      expect {
        bot.direction = "WEST"
      }.to change { bot.direction }.from("NORTH").to("WEST")
    end
    
    it "doesn't change direction if new direction isn't valid" do
      bot = ToyRobotSimulator::Bot.new(0, 0, "NORTH")
      expect {
        bot.direction = "NORTH-EAST"
      }.not_to change { bot.direction }
    end
  end
end
