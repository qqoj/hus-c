class EveCentralPrice
  def self.get(type_id, system)
    response = JSON.parse(RestClient.get "#{Rails.configuration.eve_central}?typeid=#{type_id}&usesystem=#{system}").first.deep_symbolize_keys!
    {
        buy: response[:buy][:median],
        sell: response[:sell][:median],
        all: response[:all][:median],
    }
  end
end