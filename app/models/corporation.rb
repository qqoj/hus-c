class Corporation
  BLUEPRINTS = "https://api.eveonline.com/corp/Blueprints.xml.aspx?keyID=5145106&vCode=ROEyOw01BXm9XPwmXiwKnHQQDv4uro64IOCm3QdpDyyWYVBIlrlzUUs3qTGhAmsH"

  def self.blueprints
    Hash.from_xml(RestClient.get(BLUEPRINTS))
        .deep_symbolize_keys[:eveapi][:result][:rowset][:row]
        .map { |row| to_blueprint(row) }
  end

  private

  def self.to_blueprint(row)
    blueprint = Blueprint.find_by(type_id: row[:typeID])
    blueprint.material_efficiency = row[:materialEfficiency].to_i
    blueprint.time_efficiency = row[:timeEfficiency].to_i
    blueprint.runs = row[:runs].to_i
    blueprint
  end
end