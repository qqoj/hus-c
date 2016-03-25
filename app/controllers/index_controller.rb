class IndexController < ApplicationController
  def index
    @blueprints = Blueprint.all
  end
end
