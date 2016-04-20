require 'rails_helper'

RSpec.describe 'database updater' do
  xit 'updates the states with current install totals' do
    state = State.find_by(name: 'CO')
    state.update(installs: 2600)
    database_updater = DatabaseUpdater.new
    states = database_updater.update_states_with_install_totals
    state = State.find_by(name: 'CO')

    expect(states.count).to eq 52
    expect(state.installs).to eq 2601
  end
end
