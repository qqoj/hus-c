class EveItem < ActiveRecord::Base
  def self.get(type_id)
    self.find_by type_id: type_id
  end

  def price(type=nil, options=nil)
    begin
      raise unless type && options
      EveCentralPrice.get(type_id, options)[type]
    rescue
      read_attribute :price
    end
  end
end
