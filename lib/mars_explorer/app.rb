module MarsExplorer
  class Axis
    attr_accessor :value
  end
end

module MarsExplorer
  class XAxis < MarsExplorer::Axis
    def initialize(value)
      @value = value
    end
  end
end

module MarsExplorer
  class YAxis < MarsExplorer::Axis
    def initialize(value)
      @value = value
    end
  end
end

module MarsExplorer
  class Robot

    def initialize(args)
      @x = args.fetch(:x, MarsExplorer::XAxis.new(0))
      @y = args.fetch(:y, MarsExplorer::YAxis.new(0))
      @nose = args.fetch(:nose, 'N')
    end

    def move
      axis_selector[nose.to_sym][:axis].value += axis_selector[nose.to_sym][:value]
    end

    def turn(direction)
      @nose = directions[direction.to_sym][@nose.to_sym]
    end

    def position
      "(#{@x.value}, #{@y.value}, #{nose})"
    end

    private
    attr_reader :nose

    def directions
      { R: { N: 'E', E: 'S', S: 'W', W: 'N'}, 
        L: { N: 'W', W: 'S', S: 'E', E: 'N' } }
    end

    def axis_selector
      {
        N: { axis: @y, value: 1 },
        E: { axis: @x, value: 1 },
        S: { axis: @y, value: -1 },
        W: { axis: @x, value: -1 }
      }
    end
  end
end

module MarsExplorer
  class App < Sinatra::Base
    post '/rest/mars/:command' do |command|
      robot = MarsExplorer::Robot.new(nose: 'N')

      command.each_char do |c|
        if c == 'M'
          robot.move
        elsif c == 'R' || c == 'L'
          robot.turn c
        end
      end

      robot.position
    end
  end
end
