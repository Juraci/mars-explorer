require 'spec_helper'

describe 'Mars Explorer API' do

  describe 'POST /rest/mars/' do
    context 'when posting a rotation command' do
      it 'returns (2, 0, S )' do
        post '/rest/mars/MMRMMRMM'

        expect(last_response.status).to eq 200 
        expect(last_response.body).to eq '(2, 0, S)'
      end
    end
  end

end
