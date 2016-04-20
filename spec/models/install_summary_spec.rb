require 'rails_helper'

RSpec.describe 'InstallSummary' do
  it 'returns average price per watt' do
    VCR.use_cassette 'install_summary' do
      service = InstallSummary.new(80220)
      price = service.average_price_per_watt

      expect(price).to eq 6.93
    end
  end

  it 'returns the total number of installs for zipcode' do
    VCR.use_cassette 'install_summary' do
      service = InstallSummary.new(80220)
      install_total = service.total_installs

      expect(install_total).to eq 20
    end
  end
end


