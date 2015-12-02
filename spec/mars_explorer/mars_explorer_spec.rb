require 'spec_helper'

describe 'Mars Explorer' do
  it 'returns hello world' do
    post '/rest/mars/MMRMMRMM'

    expect(last_response).to eq '(2, 0, S)'
  end
end
