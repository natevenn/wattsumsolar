class SolarCalculatorController < ApplicationController
  def show
    @us_states = UsStates.all
    @system_capacity = SystemCapacity.all
    @azimuth_angles = AzimuthAngle.all
    @state_avg_kwh = StateAvgKwh.all
  end
end

