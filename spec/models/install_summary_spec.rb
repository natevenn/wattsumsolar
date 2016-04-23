require 'rails_helper'

RSpec.describe 'InstallSummary' do

  it 'returns the total number of installs for state' do
    VCR.use_cassette 'install_summary#state' do
      service = InstallSummary.new('CO')
      result = service.install_count_by_state

      expect(result).to eq 2601
    end
  end

  it 'returns the avg price per watt for state' do
    VCR.use_cassette 'install_summary#state' do
      service = InstallSummary.new('CO')
      result = service.install_price_per_watt

      expect(result).to eq 5791
    end
  end
end
