class State < ActiveRecord::Base

  def self.format_data
    all.map.with_object({}) do |state, hash|
       hash[state.name] = { 'fillKey' => state.rank, 'installs' => state.installs }
    end
  end

  def rank
    assign_ranking_category(installs)
  end

  def assign_ranking_category(install_count)
    if install_count >= 10000
      "highest"
    elsif (1000..9999).include?(install_count)
      "mid_highest"
    elsif (100..999).include?(install_count)
      "mid_lowest"
    else
      "lowest"
    end
  end
end
