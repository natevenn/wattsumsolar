require 'rails_helper'

RSpec.describe State, type: :model do
  context 'it finds states ranking' do
    it 'assigns a state it ranking category' do
      State.create!(name: 'CO', installs: 10000)
      State.create!(name: 'CO', installs: 1172)
      State.create!(name: 'CO', installs: 400)
      State.create!(name: 'CO', installs: 10)

      rankings = State.all.map do |state|
        state.rank
      end

      expect(rankings).to match_array ['highest',
                                       'mid_highest',
                                       'mid_lowest',
                                       'lowest']
    end
  end
end
