class AverageRetailPriceOfElectricity

  def self.avg_price_per_kilowatt(state)
    service = UsEnergyInformationService.new(state)
    result = service.avg_price_per_kw
    result.series[0].data[0][1]
  end
end
