require 'rails_helper'

RSpec.describe 'NrelServices' do

  context 'install total by state' do
    it 'it returns the total number of installs by state' do
      VCR.use_cassette 'NrelService#totalinstalls' do
        service = NrelInstallSummaryService.new
        response = service.install_summary_by_state('CO')
        total_installs = response.result.total_installs
        avg_watt_price = response.result.avg_cost_pw

        expect(avg_watt_price).to eq 5.791
        expect(total_installs).to eq 2601
      end
    end
  end
end
