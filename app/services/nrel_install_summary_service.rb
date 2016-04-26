class NrelInstallSummaryService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://developer.nrel.gov/api/solar/open_pv/installs/summaries')
    connection.params['api_key'] = ENV['NREL_API_KEY']
  end

  def install_summary_by_zipcode(zipcode)
    parse(connection.get("?zipcode=#{zipcode}"))
  end

  def install_summary_by_state(state)
    parse(connection.get("?state=#{state}"))
  end

  def price_per_watt(state)
    parse(connection.get("?state=#{state}&mindate=1420071728"))
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end
end
