class SolarCalculatorController < ApplicationController
  def show
    @us_states = UsStates.all
    @system_capacity = SystemCapacity.all
  end
end

