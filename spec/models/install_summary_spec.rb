require 'rails_helper'

RSpec.describe 'InstallSummary' do
  it 'returns average price per watt' do
    VCR.use_cassette 'install_summary' do
      service = InstallSummary.new
      price = service.average_price_per_watt(80220)

      expect(price).to eq 6.93
    end
  end

  it 'returns the total number of installs for zipcode' do
    VCR.use_cassette 'install_summary' do
      service = InstallSummary.new
      result = service.install_count_by_zipcode(80220)

      expect(result).to eq 20
    end
  end

  it 'returns the total number of installs for state' do
    VCR.use_cassette 'install_summary#state' do
      service = InstallSummary.new
      result = service.install_count_by_state('CO')

      expect(result).to eq 2601
    end
  end
end


