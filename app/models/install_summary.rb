class InstallSummary
  attr_reader :service

  def initialize
    @service = NrelInstallSummaryService.new
  end

  def average_price_per_watt(zipcode)
    output = service.install_summary_by_zipcode(zipcode)
    output.result.avg_cost_pw.round(2)
  end

  def total_installs_by_zipcode(zipcode)
    output = service.install_summary_by_zipcode(zipcode)
    output.result.total_installs
  end

  def total_installs_by_state(state)
    output = service.install_summary_by_state(state)
    output.result.total_installs
  end
end
