module MarsExplorer
  class Robot
    def initialize(args)
      @x = args.fetch(:x, MarsExplorer::Axis.new(0))
      @y = args.fetch(:y, MarsExplorer::Axis.new(0))
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
