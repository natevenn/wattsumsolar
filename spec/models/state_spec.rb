require 'rails_helper'

RSpec.describe State, type: :model do
  context 'it finds states ranking' do
    it 'assigns a state it ranking category' do
      State.find_or_create_by(name: 'CO', installs: 10000)
      State.find_or_create_by(name: 'GA', installs: 172)
      State.find_or_create_by(name: 'AL', installs: 2601)
      State.find_or_create_by(name: 'NY', installs: 10)

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
