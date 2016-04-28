require 'rails_helper'

RSpec.describe 'azimuth' do
  it 'returns all aziumth' do
    result = AzimuthAngle.all
    system_sizes =
    [['south 180 degrees', '180'],
    ['southwest 225 degrees', '225'],
    ['West 270 degrees', '270'],
    ['Northwest 315 degrees', '315'],
    ['North 0 degrees', '0'],
    ['Northeast 45 degrees', '45'],
    ['East 90 degrees', '90'],
    ['Southeast 135 degress', '135']]

    expect(result.count).to eq 8
  end
end

