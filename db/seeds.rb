class Seed
  def initialize
    generate_states
  end

  def generate_states
    count = 0
    UsStates.all.each do |state|
      count += 1
      State.create!(name: state.last, installs: install_count(state.last))
      puts "#{state.last} created, count: #{count}"
    end
  end

  def install_count(state)
    InstallSummary.new.install_count_by_state(state)
  end
end

Seed.new
