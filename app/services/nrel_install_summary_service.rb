class NrelInstallSummaryService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('https://developer.nrel.gov/api/solar/open_pv/installs/summaries')
    connection.params['api_key'] = ENV['NREL_API_KEY']
  end

  def install_summary(zipcode)
    parse(connection.get("?zipcode=#{zipcode}"))
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end
end
