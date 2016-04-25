require 'rails_helper'

RSpec.describe 'system_capacity_helper' do
  it 'returns all systems_capacities' do
    result = SystemCapacity.all
    system_sizes = ['1', '2', '3', '4', '5',
                   '6', '7', '8', '9', '10',
                   '11', '12', '13', '14', '15',
                   '16', '17', '18', '19', '20']

    expect(result.count).to eq 20
    result.each do |size|
      boolean = system_sizes.include?(size.last)
      expect(boolean).to eq true
    end
  end
end
