class PvWatts
  attr_reader :service

  def initialize
    @service = NrelPvWattsService.new
  end

  def calculate_annual_ac_output(zip, system_size, degrees, angle)
   results = service.ac_output_by_system_size(zip,
                                    system_size,
                                    degrees,
                                    angle)
   results.outputs.ac_annual.round
  end
end
