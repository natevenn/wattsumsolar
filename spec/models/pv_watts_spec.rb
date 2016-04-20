require 'rails_helper'

RSpec.describe 'PvWatts' do
  it 'returns the annual ac output' do
    VCR.use_cassette 'PvWatts' do
      service = PvWatts.new
      ac_output = service.calculate_annual_ac_output(80220, 4, 180, 40)
      expect(ac_output).to eq 6291
    end
  end
end
