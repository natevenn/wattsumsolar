require 'rails_helper'

RSpec.describe StateAvgKwh, type: :model do
  context 'Avg kwh' do
    it 'counts all states' do
      result = StateAvgKwh.states_array
      sorted_data = StateAvgKwh.all

      expect(result.count).to eq 51
      expect(sorted_data[0]).to eq ["Alabama", 15180]
    end
  end
end

