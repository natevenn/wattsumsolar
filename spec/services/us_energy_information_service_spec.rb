require 'rails_helper'

RSpec.decribe 'UsEnergyInformationService' do
  context 'annual residential electricity price' do
    it 'returns the price per kw for state' do
      VCR.use_cassette 'UsEnergyInformationService' do
        service = UsEnergyInformationService.new
        response = service.avg_price_per_kw(state)

        expect(response).to eq 11
      end
    end
  end
end
