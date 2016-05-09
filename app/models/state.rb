class State < ActiveRecord::Base
  include StateRank
# use j builder to format this data
  def self.format_data
    all.map.with_object({}) do |state, hash|
      hash[state.name] = { 'fillKey'        => state.rank,
                           'installs'       => state.installs,
                           'price_per_watt' => state.price_per_watt }
    end
  end

  def format_data_for_state
    { name => { 'fillKey'        => rank,
                'installs'       => installs,
                'price_per_watt' => price_per_watt } }
  end
end
