module TypeId
  extend ActiveSupport::Concern

  module ClassMethods
    def type_id(query)
      case query
        when Numeric
          return query
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