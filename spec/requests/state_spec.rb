require 'rails_helper'

RSpec.describe 'States' do
  it 'returns a collection of all states and thier total install count' do
    State.find_or_create_by(name: 'AL', installs: 2601, price_per_watt: 5791)
    State.find_or_create_by(name: 'NY', installs: 1601, price_per_watt: 6783)
    State.find_or_create_by(name: 'CA', installs: 22101, price_per_watt: 8722)

    get '/api/v1/install_summary'

    expect(response.status).to eq 200

    body = JSON.parse(response.body)

    expect(body.count).to eq 3

    expect(body['AL']['installs']).to eq 2601
    expect(body['NY']['installs']).to eq 1601
    expect(body['CA']['installs']).to eq 22101
    expect(body['NY']['price_per_watt']).to eq 6783
    expect(body['CA']['price_per_watt']).to eq 8722
  end

  it 'returns a single state' do
    State.create(name: 'CO', installs: 2601, price_per_watt: 5791)
    State.create(name: 'NY', installs: 1601, price_per_watt: 6783)
    State.create(name: 'CA', installs: 22101, price_per_watt: 8722)

    get '/api/v1/install_summary/CO'

    expect(response.status).to eq 200

    body = JSON.parse(response.body)

    expect(body.count).to eq 1
    expect(body['CO']['installs']).to eq 2601
    expect(body['CO']['price_per_watt']).to eq 5791
  end
end

