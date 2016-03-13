module ToyRobotSimulator
  class Bot
    TABLETOP_WIDTH = 5
    TABLETOP_HEIGHT = 5
    DIRECTIONS = %i(north south east west)
    MOVEMENTS = {
      north: [0, 1],
      south: [0, -1],
      east:  [-1, 0],
      west:  [1, 0]
    }

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

    def move
      new_x, new_y = x + movement[0], y + movement[1]
      if coordinates_valid?(new_x: new_x, new_y: new_y)
        @x, @y = new_x, new_y
      end
    end

    def inspect
      [x, y, direction].join(",")
    end

    private

    def coordinates_valid?(new_y: y, new_x: x)
      new_x.between?(0, TABLETOP_WIDTH) &&
        new_y.between?(0, TABLETOP_HEIGHT)
    end

    def direction_valid?(new_direction = direction)
      DIRECTIONS.include? new_direction
    end

    def movement
      MOVEMENTS[direction]
    end
  end
end
