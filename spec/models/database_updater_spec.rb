require 'rails_helper'

RSpec.describe 'database updater' do
  it 'updates the states with current install totals' do
    VCR.use_cassette 'update_database' do

    State.find_or_create_by(name: 'CO', installs: 600, price_per_watt: 7030)
    State.find_or_create_by(name: 'CA', installs: 300, price_per_watt: 4002)

    DatabaseUpdater.update

    state1 = State.find_by(name: "CO")
    state2 = State.find_by(name: "CA")

    expect(state1.installs).to eq(2601)
    expect(state1.price_per_watt).to eq(2498)
    expect(state2.installs).to eq(291518)
    expect(state2.price_per_watt).to eq(4495)
    end
  end
end
