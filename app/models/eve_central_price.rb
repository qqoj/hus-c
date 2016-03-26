class EveCentralPrice
  def self.get(type_id)
    response = JSON.parse(RestClient.get "http://api.eve-central.com/api/marketstat/json?typeid=#{type_id}").first.deep_symbolize_keys!
    {
        buy: response[:buy][:median],
        sell: response[:sell][:median],
        all: response[:all][:median],
    }
  end
end