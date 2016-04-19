require 'rails_helper'

RSpec.describe 'NrelServices' do

  context 'install summary with zipcode' do
    it 'it returns the average price per watt' do
      VCR.use_cassette 'NrelService#summary' do
        service = NrelSummaryService.new
        response = service.install_summary(80220)
        avg_watt_price = response['result']['avg_cost_pw']
        total_installs = response['result']['total_installs']

        expect(avg_watt_price).to eq 6.928
        expect(total_installs).to eq 20
      end
    end
  end

  context 'pv watts v5' do
    it 'returns the system size and annual kwh' do
      VCR.use_cassette 'NrelService#pvwatts' do
        service = NrelPvWattsService.new
        response = service.kk
      end
    end
  end

end
