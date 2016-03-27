class EveCentralPrice
  def self.get(type_id, options)
    prices = Rails.cache.fetch "eve-central/#{options[:system]}/#{type_id}", expires_in: 8.hours do
      JSON.parse(RestClient.get "#{Rails.configuration.eve_central}?typeid=#{type_id}&usesystem=#{options[:system]}").first.deep_symbolize_keys!
    end
    {buy: prices[:buy][options[:buy].to_sym], sell: prices[:sell][options[:sell].to_sym]}
  end
end