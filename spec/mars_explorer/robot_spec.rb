require 'spec_helper'

module MarsExplorer
  describe Robot do
    it 'should start in (0, 0, N) position' do
      x = instance_double('MarsExplorer::Axis', value: 0)
      y = instance_double('MarsExplorer::Axis', value: 0)

      robot = MarsExplorer::Robot.new(x: x, y: y)
      
      expect(robot.position).to eq '(0, 0, N)'
    end
  end
end
