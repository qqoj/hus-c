class IndexController < ApplicationController
  def index
  end

  def search
    results = search_by(params[:value])
    flash[:notice] = "Too many blueprints, showing first 10" if results.size > 10
    @blueprints = results[0..9]
                      .each { |b| b.system = cookies[:system] }
                      .sort_by { |b| -b.per_hour(b.profit) }
    render :index
  end

  private

  def search_by(query)
    query
        .lines
        .map { |l| l.strip.split("\t").first }
        .compact
        .map { |l| EveItem.where(name: "#{l.gsub(/ Blueprint/, '')} Blueprint").to_a }
        .flatten
        .map { |i| Blueprint.find_by(type_id: i.type_id) }
        .uniq
  end
end
