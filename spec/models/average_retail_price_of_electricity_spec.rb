require 'rails_helper'

RSpec.describe 'average retail price of electricity' do
  it 'returns the average price of electricity for state' do
    VCR.use_cassette 'AvgRetailPriceOfElec' do
      avg_price  = AverageRetailPriceOfElectricity
          .avg_price_per_kilowatt('CO')

      expect(avg_price).to eq 11.98
    end
  end
end
