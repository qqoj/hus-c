class Blueprint < ActiveRecord::Base
  serialize :activities, Hash

  def name
    EveItem.find_by(type_id: type_id).try :name
  end
end
