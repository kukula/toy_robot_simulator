require 'spec_helper'

describe ToyRobotSimulator do
  it 'has a version number' do
    expect(ToyRobotSimulator::VERSION).not_to be nil
  end

  describe ".run" do
    ["0,1,NORTH", "0,0,WEST", "3,3,NORTH"].each_with_index do |expected, i|
      specify "Acceptance example ##{i}" do
        filename = File.join File.dirname(__FILE__), "examples", "example_#{i}"
        file = File.open(filename)

        expect($stdout).to receive(:puts).with(expected)

        ToyRobotSimulator.run(file)
      end
    end
  end
end
