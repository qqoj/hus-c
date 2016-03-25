class Blueprint < ActiveRecord::Base
  serialize :activities, Hash

  def name
    EveName.find_by(type_id: type_id).try :value
  end
end
