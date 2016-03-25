class EveItem < ActiveRecord::Base
  class << self
    def get(param)
      self.find_by(type_id: param['typeID'])
    end
  end
end
