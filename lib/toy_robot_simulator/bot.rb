module ToyRobotSimulator
  class Bot
    TABLETOP_WIDTH = 5
    TABLETOP_HEIGHT = 5
    DIRECTIONS = %w(NORTH SOUTH EAST WEST)

    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
      @x, @y, @direction = x, y, direction
    end

    def valid?
      coordinates_valid? && direction_valid?
    end

    def direction=(new_direction)
      if direction_valid? new_direction
        @direction = new_direction
      end
    end

    def inspect
      [x, y, direction].map(&:to_s).join(",")
    end

    private

    def coordinates_valid?
      x.between?(0, TABLETOP_WIDTH) &&
        y.between?(0, TABLETOP_HEIGHT)
    end

    def direction_valid?(new_direction = direction)
      DIRECTIONS.include? new_direction.to_s.upcase
    end
  end
end
