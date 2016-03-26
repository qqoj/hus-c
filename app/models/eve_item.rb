class EveItem < ActiveRecord::Base
  def self.get(type_id)
    self.find_by type_id: type_id
  end
end
