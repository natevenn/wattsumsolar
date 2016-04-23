class InstallSummary
  attr_reader :service

  def initialize(state)
    @service ||= NrelInstallSummaryService.new.
      install_summary_by_state(state)
  end

  def install_count_by_state
    service.result.total_installs
  end

  def install_price_per_watt
    format_price(service.result.avg_cost_pw)
  end

  def format_price(price)
    (price * 1000).to_i
  end
end
