require 'spec_helper'

describe ToyRobotSimulator::Bot do
  let(:bot) { ToyRobotSimulator::Bot.new }

  describe "#place" do
    it "places bot and returns true if coordinates and direction are valid" do
      expect(bot.place(0, 0, :north)).to be_truthy
    end

    it "places bot and returns false if coordinate x is out of tabletop" do
      expect(bot.place(-1, 0, :north)).to be_falsey
    end

    it "places bot and returns false if coordinate y is out of tabletop" do
      y = ToyRobotSimulator::Bot::TABLETOP_HEIGHT + 1
      expect(bot.place(0, y, :north)).to be_falsey
    end

    it "places bot and returns false if direction is not listed" do
      expect(bot.place(0, 0, :one)).to be_falsey
    end
  end

  describe "#direction=" do
    it "changes direction if new direction is valid" do
      bot.place(0, 0, :north)

      expect {
        bot.direction = :west
      }.to change { bot.direction }.from(:north).to(:west)
    end
    
    it "doesn't change direction if new direction isn't valid" do
      bot.place(0, 0, :north)

      expect {
        bot.direction = :north_east
      }.not_to change { bot.direction }
    end
  end

  describe "#move" do
    it "moves robot one unit north" do
      bot.place(0, 0, :north)

      expect { bot.move}.to change { bot.inspect }.
        from("0,0,north").to("0,1,north")
    end

    it "moves robot one unit south" do
      bot.place(0, 3, :south)

      expect { bot.move}.to change { bot.inspect }.
        from("0,3,south").to("0,2,south")
    end

    it "moves robot one unit east" do
      bot.place(3, 0, :east)

      expect { bot.move}.to change { bot.inspect }.
        from("3,0,east").to("2,0,east")
    end

    it "moves robot one unit north" do
      bot.place(0, 0, :west)

      expect { bot.move}.to change { bot.inspect }.
        from("0,0,west").to("1,0,west")
    end

    it "doesn't move robot when it's on edge" do
      bot.place(0, 0, :south)

      expect { bot.move}.not_to change { bot.inspect }
    end
  end
end
