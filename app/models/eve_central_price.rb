class EveCentralPrice
  def self.get(type_id, options)
    prices = Rails.cache.fetch "eve-central/#{options[:system]}/#{type_id}", expires_in: 8.hours do
      JSON.parse(RestClient.get "#{Rails.configuration.eve_central}?typeid=#{type_id}&usesystem=#{options[:system]}").first.deep_symbolize_keys!
    end
    {
        materials: prices[options[:materials_order].to_sym][options[:materials].to_sym],
        products: prices[options[:products_order].to_sym][options[:products].to_sym]
    }
  end
end