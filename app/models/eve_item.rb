class EveItem < ActiveRecord::Base
  include TypeId

  def self.get(query)
    self.find_by type_id: type_id(query)
  end
end
