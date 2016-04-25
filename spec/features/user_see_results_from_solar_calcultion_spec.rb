require 'rails_helper'

RSpec.feature 'vistor visits solar calculator' do
  scenario 'returns calculation results', js: true do

    State.create!(name: 'AL', installs: '2601', price_per_watt: 5709)

    visit '/'

    click_on "Get Started"

    expect(current_path).to eq '/solar_calculator'

    page.execute_script("$('#state').val('AL')")
    fill_in "zip", with: 36006
    fill_in "kwh", with: 6000
    page.execute_script("$('#roof-angle').val('30')")
    page.execute_script("$('#azimuth-angle').val('180')")
    page.execute_script("$('#system').val('4')")
    sleep(3)
    click_on "Calculate"
    sleep(3)

    expect(page).to have_content "Results"
    expect(page).to have_content 'Total system ac output 5709 kilowatts'
    expect(page).to have_content 'Percentage offset 95%'
    expect(page).to have_content 'Upfront cost $22,836'
    expect(page).to have_content 'Payoff time 23 years'
  end
end
