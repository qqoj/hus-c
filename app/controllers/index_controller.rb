class IndexController < ApplicationController
  def index
  end

  def search
    @blueprints = params[:value]
                      .lines
                      .map { |l| l.strip.split("\t").first }
                      .compact
                      .map { |l| EveItem.where(name: "#{l.gsub(/ Blueprint/, '')} Blueprint").to_a }
                      .flatten
                      .map { |i| Blueprint.find_by type_id: i.type_id }
                      .uniq
    render :index
  end
end
