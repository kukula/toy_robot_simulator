require 'spec_helper'

describe ToyRobotSimulator::Controller do
  describe "#perform" do
    let(:bot) { instance_double(ToyRobotSimulator::Bot) }

    it "moves bot when command 'MOVE'" do
      controller = ToyRobotSimulator::Controller.new(bot, "MOVE")
      expect(bot).to receive(:move)
      expect(controller.perform).to be_truthy
    end

    it "inspects bot when command 'REPORT'" do
      controller = ToyRobotSimulator::Controller.new(bot, "REPORT")
      expect(bot).to receive(:inspect).and_return('0,0,north')
      expect(controller.perform).to be_truthy
    end

    ToyRobotSimulator::Controller::DIRECTIONS.each do |direction|
      it "changes bot direction when command '#{direction}'" do
        controller = ToyRobotSimulator::Controller.new(bot, direction)
        expect(bot).to receive(:direction=).with(direction.downcase.to_sym)
        expect(controller.perform).to be_truthy
      end
    end

    it "returns false when command not found" do
      controller = ToyRobotSimulator::Controller.new(bot, "LAUGH")
      expect(controller.perform).to be_falsey
    end
  end
end
