class EveCentralPrice
  include TypeId

  def self.get(query)
    response = JSON.parse(RestClient.get "http://api.eve-central.com/api/marketstat/json?typeid=#{type_id(query)}").first.deep_symbolize_keys!
    {
        buy: response[:buy][:median],
        sell: response[:sell][:median],
    }
  end
end