class IndexController < ApplicationController
  include PriceHelper

  LIMIT = 10

  def index
  end

  def search
    @value = params[:value]
    results = search_by(@value)
    flash[:notice] = "Too many blueprints, showing first #{LIMIT}" if results.size > LIMIT
    @blueprints = results[0..LIMIT-1]
                      .each { |b| b.price_options = price_options }
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
