class InstallSummary
  attr_reader :service

  def initialize(zipcode)
    @service = NrelInstallSummaryService.new.install_summary(zipcode)
  end

  def average_price_per_watt
    service.result.avg_cost_pw.round(2)
  end

  def total_installs
    service.result.total_installs
  end
end
