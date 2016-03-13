require 'spec_helper'

describe ToyRobotSimulator::Bot do
  describe "#valid?" do
    it "returns true if coordinates and direction are valid" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :north)
      expect(bot).to be_valid
    end

    it "returns false if coordinate x is out of tabletop" do
      bot = ToyRobotSimulator::Bot.new(-1, 0, :north)
      expect(bot).not_to be_valid
    end

    it "returns false if coordinate y is out of tabletop" do
      y = ToyRobotSimulator::Bot::TABLETOP_HEIGHT + 1
      bot = ToyRobotSimulator::Bot.new(0, y, :north)
      expect(bot).not_to be_valid
    end

    it "returns false if direction is not listed" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :one)
      expect(bot).not_to be_valid
    end
  end

  describe "#direction=" do
    it "changes direction if new direction is valid" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :north)
      expect {
        bot.direction = :west
      }.to change { bot.direction }.from(:north).to(:west)
    end
    
    it "doesn't change direction if new direction isn't valid" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :north)
      expect {
        bot.direction = :north_east
      }.not_to change { bot.direction }
    end
  end

  describe "#move" do
    it "moves robot one unit north" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :north)
      expect { bot.move}.to change { bot.inspect }.
        from("0,0,north").to("0,1,north")
    end

    it "moves robot one unit south" do
      bot = ToyRobotSimulator::Bot.new(0, 3, :south)
      expect { bot.move}.to change { bot.inspect }.
        from("0,3,south").to("0,2,south")
    end

    it "moves robot one unit east" do
      bot = ToyRobotSimulator::Bot.new(3, 0, :east)
      expect { bot.move}.to change { bot.inspect }.
        from("3,0,east").to("2,0,east")
    end

    it "moves robot one unit north" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :west)
      expect { bot.move}.to change { bot.inspect }.
        from("0,0,west").to("1,0,west")
    end

    it "doesn't move robot when it's on edge" do
      bot = ToyRobotSimulator::Bot.new(0, 0, :south)
      expect { bot.move}.not_to change { bot.inspect }
    end
  end
end
