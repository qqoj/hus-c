class Blueprint < ActiveRecord::Base
  serialize :activities, Hash

  def activities=(activities)
    self[:activities] = activities.try(:deep_symbolize_keys!)
  end

  def materials
    activities.try(:[], :manufacturing).try(:[], :materials) || []
  end

  def materials_buy
    materials.reduce(0) do |a, m|
      a + m[:quantity] * (EveItem.get(m[:typeID]).try(:price, :buy) || 0)
    end
  end

  def products
    activities.try(:[], :manufacturing).try(:[], :products) || []
  end

  def products_sell
    products.reduce(0) do |a, p|
      a + p[:quantity] * (EveItem.get(p[:typeID]).try(:price, :sell) || 0)
    end
  end
end
