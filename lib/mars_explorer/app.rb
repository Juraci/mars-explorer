module MarsExplorer
  class App < Sinatra::Base
    post '/rest/mars/:command' do |command|
      robot = MarsExplorer::Robot.new(nose: 'N')

      command.each_char do |c|
        if c == 'M'
          robot.move
        elsif c == 'R' || c == 'L'
          robot.turn c
        else
          halt 400
        end
      end

      robot.position
    end
  end
end
