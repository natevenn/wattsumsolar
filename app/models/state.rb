class State < ActiveRecord::Base

  def self.format_data
    all.map.with_object({}) do |state, hash|
       hash[state.name] = { 'fillKey' => state.rank, 'installs' => state.installs }
    end
  end

  def rank
    'highest'
  end
end
