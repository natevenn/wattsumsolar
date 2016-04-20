class DatabaseUpdater
  #include UsStates

  attr_reader :installs_by_state, :us_states

  def initialize
    @installs_by_state = InstallSummary.new
    @us_states = UsStates.all
  end

  def install_count(state)
    install_by_state.install_count_by_state(state)
  end

  def update_states_with_install_totals
    us_states.each do |state|
      state = State.find_by(name: state.last)
      state.update(installs: install_count(state.last)
    end
  end
end
