class StateSerializer < ActiveModel::Serializer
  attributes :name, :installs, :updated_at
end
