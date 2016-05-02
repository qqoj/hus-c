module ApplicationHelper
  def available_systems
    options_for_select [
                           ['Amarr', 30002187],
                           ['Jita', 30000142],
                           ['Dodixie', 30002659],
                           ['Rens', 30002510],
                           ['Hek', 30002053],
                           ['Teonusude', 30002385],
                           ['Sasta', 30000005],
                       ], 30002187
  end

  def available_prices(type)
    options_for_select [
                           %w(Min min),
                           %w(Max max),
                           %w(Median median),
                           %w(Average avg),
                       ], {materials: 'max', products: 'min'}[type]
  end
end
