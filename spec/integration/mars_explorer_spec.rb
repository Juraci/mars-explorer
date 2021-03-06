require 'spec_helper'

describe 'Mars Explorer API' do

  describe 'POST /rest/mars/:command' do
    context 'when posting a rotation command' do
      it 'returns (2, 0, S)' do
        post '/rest/mars/MMRMMRMM'

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq '(2, 0, S)'
      end
    end

    context 'when posting a left movement command' do
      it 'returns (0, 2, W)' do
        post '/rest/mars/MML'

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq '(0, 2, W)'
      end
    end

    context 'when posting a left movement command twice' do
      it 'returns (0, 2, W)' do
        2.times { post '/rest/mars/MML' }

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq '(0, 2, W)'
      end
    end

    context 'when posting an invalid command' do
      it 'returns 400 bad request' do
        post '/rest/mars/AAA'

        expect(last_response.status).to eq 400
      end
    end

    context 'when posting an invalid position' do
      it 'returns 400 bad request' do
        post '/rest/mars/MMMMMMMMMMMMMMMMMMMMMMMM'

        expect(last_response.status).to eq 400
      end
    end
  end
end
