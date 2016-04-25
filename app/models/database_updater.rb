class DatabaseUpdater

  def self.update
    State.all.each do |state|
      service = InstallSummary.new(state.name)
      state = state.update_attributes(installs: service.install_count_by_state,
                   price_per_watt: service.install_price_per_watt)

    end
  end
end
