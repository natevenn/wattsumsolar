require 'rails_helper'

RSpec.describe 'UsStates' do
  it 'verifies 52 states' do
    states = UsStates.all

    expect(states.count).to eq 52
  end
end
