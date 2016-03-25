class Blueprint < ActiveRecord::Base
  serialize :activities, Hash

  def materials
    activities.try(:[], 'manufacturing').try(:[], 'materials') || []
  end

  def cost
    materials.reduce(0) do |a, m|
      a + m['quantity'] * (EveItem.get(m).try(:price) || 0)
    end
  end
end
