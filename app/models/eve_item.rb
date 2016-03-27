class EveItem < ActiveRecord::Base
  def self.get(type_id)
    self.find_by type_id: type_id
  end

  def price(type=nil, system=nil)
    begin
      raise unless type && system
      EveCentralPrice.get(type_id, system)[type]
    rescue
      read_attribute :price
    end
  end
end
