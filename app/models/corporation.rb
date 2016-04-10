class Corporation
  BLUEPRINTS = "https://api.eveonline.com/corp/Blueprints.xml.aspx?keyID=#{ENV['HUSC_API_KEY_ID']}&vCode=#{ENV['HUSC_API_VERIFICATION_CODE']}"
  JOBS = "https://api.eveonline.com/corp/IndustryJobs.xml.aspx?keyID=#{ENV['HUSC_API_KEY_ID']}&vCode=#{ENV['HUSC_API_VERIFICATION_CODE']}"

  def self.blueprints
    jobs = fetch(JOBS).map { |j| j[:blueprintID] }
    fetch(BLUEPRINTS).map do |row|
      b = to_blueprint(row)
      b.job = jobs.include? row[:itemID]
      b
    end
  end

  private

  class << self
    def to_blueprint(row)
      blueprint = Blueprint.find_by(type_id: row[:typeID])
      blueprint.material_efficiency_percentage = row[:materialEfficiency].to_i
      blueprint.time_efficiency_percentage = row[:timeEfficiency].to_i
      blueprint.runs = row[:runs].to_i
      blueprint
    end

    def fetch(url)
      Hash.from_xml(RestClient.get(url)).deep_symbolize_keys[:eveapi][:result][:rowset][:row]
    end
  end
end