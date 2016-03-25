class IndexController < ApplicationController
  def index
    @blueprints = YAML.load File.open(Rails.root.join('db/eve/blueprints.yaml'))
  end
end
