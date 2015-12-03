module MarsExplorer
  class App < Sinatra::Base
    post '/rest/mars/:command' do |command|

      x = 0
      y = 0
      nose = 'N'

      command.each_char do |c|
        if c == 'M'
          if nose == 'N'
            y += 1
          elsif nose == 'E'
            x += 1
          elsif nose == 'S'
            y -= 1
          elsif nose == 'W'
            x -= 1
          end
        elsif c == 'R'
          if nose == 'N'
            nose = 'E'
          elsif nose == 'E'
            nose = 'S'
          elsif nose == 'S'
            nose = 'W'
          elsif nose == 'W'
            nose = 'N'
          end
        end
      end

      "(#{x}, #{y}, #{nose})"
    end
  end
end
