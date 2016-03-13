require 'spec_helper'

describe ToyRobotSimulator::Controller do
  describe "#perform" do
    let(:bot) { instance_double(ToyRobotSimulator::Bot) }
    let(:controller) { ToyRobotSimulator::Controller.new(bot) }

    it "moves bot when command 'MOVE'" do
      expect(bot).to receive(:move)
      expect(controller.perform("MOVE")).to be_truthy
    end

    it "inspects bot when command 'REPORT'" do
      expect(bot).to receive(:inspect).and_return('0,0,north')
      expect(controller.perform("REPORT")).to be_truthy
    end

    ToyRobotSimulator::Controller::TURNS.each do |turn|
      it "changes bot direction when command '#{turn}'" do
        expect(bot).to receive(:turn)
          .with(turn.downcase.to_sym)
          .and_return(true)
        expect(controller.perform(turn)).to be_truthy
      end
    end

    it "returns false when command not found" do
      expect(controller.perform("LAUGH")).to be_falsey
    end

    describe "command 'PLACE'" do
      it "places new bot in correct place and returns true" do
        expect(bot).to receive(:place).with(0, 0, :north).and_return(true)
        expect(controller.perform("PLACE 0,0,NORTH")).to be_truthy
      end

      it "returns false if no arguments provided" do
        expect(controller.perform("PLACE")).to be_falsey
      end

      it "returns false if not enough arguments provided" do
        expect(controller.perform("PLACE 0,0")).to be_falsey
      end

      it "returns false if Bot#place returns false" do
        expect(bot).to receive(:place).with(42, 42, :question).and_return(false)
        expect(controller.perform("PLACE 42,42,QUESTION")).to be_falsey
      end
    end
  end
end
