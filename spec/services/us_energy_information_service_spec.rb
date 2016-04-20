require 'rails_helper'

RSpec.describe 'UsEnergyInformationService' do
  context 'annual residential electricity price' do
    it 'returns the price per kw for state' do
      VCR.use_cassette 'UsEnergyInformationService' do
        service = UsEnergyInformationService.new("CO")
        response = service.avg_price_per_kw
        price = response.series[0].data[0][1]

        expect(price).to eq 11.98
      end
    end
  end
end
