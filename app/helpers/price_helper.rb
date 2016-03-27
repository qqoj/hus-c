module PriceHelper
  def price_options
    {
        system: cookies['system'],
        buy: cookies['buy'],
        sell: cookies['sell'],
    }
  end
end