require 'spec_helper'

module MarsExplorer
  describe Robot do
    it 'should start in (0, 0, N) position' do
      robot = MarsExplorer::Robot.new
      expect(robot.position).to eq '(0, 0, N)'
    end

    context '#turn' do
      context 'when the nose is pointing to the North' do
        let(:robot) { MarsExplorer::Robot.new }

        context 'when R argument is sent to turn method' do
          it 'should return (0, 0, E) as position' do
            robot.turn 'R'
            expect(robot.position).to eq '(0, 0, E)'
          end
        end

        context 'when L argument is sent to turn method' do
          it 'should return (0, 0, W) as position' do
            robot.turn 'L'
            expect(robot.position).to eq '(0, 0, W)'
          end
        end

        context 'when the robot turns 3 times to the Right' do
          it 'should return (0, 0, W) as position' do
            3.times { robot.turn 'R' }
            expect(robot.position).to eq '(0, 0, W)'
          end
        end

        context 'when the robot turns 3 times to the Left' do
          it 'should return (0, 0, E) as position' do
            3.times { robot.turn 'L' }
            expect(robot.position).to eq '(0, 0, E)'
          end
        end
      end
    end
  end
end
