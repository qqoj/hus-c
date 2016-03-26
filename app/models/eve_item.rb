class EveItem < ActiveRecord::Base
  class << self
    def get(query)
      self.find_by type_id: type_id(query)
    end

    private

    def type_id(query)
      case query
        when Hash
          return query[:typeID]
        when Blueprint
          return query.type_id
        else
          return nil
      end
    end
  end
end
