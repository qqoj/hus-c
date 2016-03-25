class Blueprint < ActiveRecord::Base
  serialize :activities, Hash
end
