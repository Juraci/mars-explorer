require 'spec_helper'

describe 'Mars Explorer API' do

  describe 'POST /rest/mars/:command' do
    context 'when posting a moviment command' do
      it 'returns (0, 2, N)' do
        post '/rest/mars/MM'

        expect(last_response.status).to eq 200 
        expect(last_response.body).to eq '(0, 2, N)'
      end
    end

    context 'when posting a rotation command' do
      it 'returns (2, 0, S )' do
        post '/rest/mars/MMRMMRMM'

        expect(last_response.status).to eq 200 
        expect(last_response.body).to eq '(2, 0, S)'
      end
    end
  end

end
