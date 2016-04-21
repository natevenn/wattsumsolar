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

    expect(body['CO']['installs']).to eq 2601
    expect(body['NY']['installs']).to eq 1601
    expect(body['CA']['installs']).to eq 22101
  end
end

