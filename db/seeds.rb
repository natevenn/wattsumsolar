class Seed
  def initialize
    generate_states
  end

  def generate_states
    count = 0
    UsStates.all.each do |state|
      count += 1
      State.create!(name: state.last,
                    installs: install_count(state.last),
                    price_per_watt: price_per_watt(state.last))
      puts "#{state.last} created, count: #{count}"
    end
  end

  def install_count(state)
    InstallSummary.new(state).install_count_by_state
  end

  def price_per_watt(state)
    InstallSummary.new(state).install_price_per_watt
  end
end

Seed.new
