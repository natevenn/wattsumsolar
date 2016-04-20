class Seed

  def initialize
    generate_states
  end

  def generate_states
    UsStates.all.each do |state|
      State.create!(name: state.last, installs: install_count(state.last)
    end
  end

  def install_count(state)
    InstallSummary.new.install_count_by_state(state)
  end
end
