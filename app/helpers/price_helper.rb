module PriceHelper
  def price_options
    {
        system: cookies['system'],
        materials: cookies['materials'],
        products: cookies['products'],
        materials_order: cookies['materials-order'],
        products_order: cookies['products-order'],
    }
  end
end