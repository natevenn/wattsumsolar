require 'rails_helper'

RSpec.describe 'NrelPvWattsServie'

context 'nrel pv watts' do
  it 'returns annual kwh for for a system size based off of location' do
    VCR.use_cassette 'NrelPvWattsService' do
      service = NrelPvWattsService.new
      response = service.ac_output_by_system_size(80220, 4, 180, 40)
      annual_kwh = response.outputs.ac_annual

      expect(annual_kwh).to eq 6291.38671875
    end
  end
end
