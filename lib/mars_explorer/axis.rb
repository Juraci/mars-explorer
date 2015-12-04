module MarsExplorer
  class Axis
    attr_accessor :value, :limit

    def initialize(args = {})
      @value = args.fetch(:value, 0)
      @limit = args.fetch(:limit, 5)
    end
  end
end
