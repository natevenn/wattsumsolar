class NrelPvWattsService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://developer.nrel.gov/api/pvwatts/v5.json')
    connection.params['api_key'] = ENV['NREL_API_KEY']
  end

  def ac_output_by_system_size(zipcode, system_size, degrees, angle)
    parse(connection.get("?address=#{zipcode}&system_capacity=#{system_size}&azimuth=#{degrees}&tilt=#{angle}&array_type=1&module_type=1&losses=15"))
  end


  private
    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end
end
