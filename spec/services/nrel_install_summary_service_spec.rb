require 'rails_helper'

RSpec.describe 'NrelServices' do

  context 'install summary with zipcode' do
    it 'it returns the average price per watt' do
      VCR.use_cassette 'NrelService#summary' do
        service = NrelInstallSummaryService.new
        response = service.install_summary_by_zipcode(80220)
        avg_watt_price = response.result.avg_cost_pw
        total_installs = response.result.total_installs

        expect(avg_watt_price).to eq 6.928
        expect(total_installs).to eq 20
      end
    end
  end

  context 'install total by state' do
    it 'it returns the total number of installs by state' do
      VCR.use_cassette 'NrelService#totalinstalls' do
        service = NrelInstallSummaryService.new
        response = service.install_summary_by_state('CO')
        total_installs = response.result.total_installs

        expect(total_installs).to eq 2601
      end
    end
  end
end
