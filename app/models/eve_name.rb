class EveName < ActiveRecord::Base
  class << self
    def get(param)
      EveName.find_by(type_id: param['typeID']).value rescue '-'
    end
  end
end
