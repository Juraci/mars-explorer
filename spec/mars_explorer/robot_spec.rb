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

    context '#move' do
      context 'when the nose is pointing to the North' do
        let(:robot) { MarsExplorer::Robot.new }

        context 'when moving one unit' do
          it 'returns (0, 1, N)' do
            robot.move
            expect(robot.position).to eq '(0, 1, N)'
          end
        end
      end

      context 'when the nose is pointing to the South' do
        let(:robot) { MarsExplorer::Robot.new(nose: 'S') }

        context 'when moving one unit' do
          it 'returns (0, -1, S)' do
            robot.move
            expect(robot.position).to eq '(0, -1, S)'
          end
        end
      end

      context 'when the movement goes above the limit' do
        it 'returns false' do
          x = MarsExplorer::Axis.new(limit: 0)
          y = MarsExplorer::Axis.new(limit: 0)

          robot = MarsExplorer::Robot.new(x: x, y: y)
          expect(robot.move).to be false
        end
      end
    end
  end
end
