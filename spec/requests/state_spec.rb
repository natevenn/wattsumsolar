require 'rails_helper'

RSpec.describe 'States' do
  it 'returns a collection of all states and thier total install count' do
    State.create(name: 'CO', installs: 2601)
    State.create(name: 'NY', installs: 1601)
    State.create(name: 'CA', installs: 22101)

    get '/api/v1/install_summary'

    expect(response.status).to eq 200

    body = JSON.parse(response.body)

    expect(body.count).to eq 3

    state_summary = body.map do |state|
      [state['name'], state['installs']]
    end

    expect(state_summary).to match_array [["CO", "2601"],
                                          ["NY", "1601"],
                                          ["CA", "22101"]]
  end
end

