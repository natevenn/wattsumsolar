class UsEnergyInformationService
  attr_reader :connection

  def initialize(state)
    @connection = Faraday.new("http://api.eia.gov/series/?api_key=#{ENV['EIA_API_KEY']}")
    connection.params['series_id'] = "ELEC.PRICE.#{state}-RES.A"
  end

  def avg_price_per_kw
    parse(connection.get)
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end
end
