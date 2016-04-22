class SolarCalculatorController < ApplicationController
  def show
    @us_states = UsStates.all
  end
end

