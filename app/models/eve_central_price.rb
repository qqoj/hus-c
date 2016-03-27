class EveCentralPrice
  def self.get(type_id, system)
    Rails.cache.fetch "eve-central/#{system}/#{type_id}", expires_in: 8.hours do
      response = JSON.parse(RestClient.get "#{Rails.configuration.eve_central}?typeid=#{type_id}&usesystem=#{system}").first.deep_symbolize_keys!
      {
          buy: response[:buy][:median],
          sell: response[:sell][:median],
          all: response[:all][:median],
      }
    end
  end
end