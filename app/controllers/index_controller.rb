class IndexController < ApplicationController
  def index
  end

  def search
    @blueprints = params[:value]
                      .lines
                      .select { |l| l =~ /Blueprint/ }
                      .map { |l| l.split("\t").first }
                      .map { |line| EveItem.where(name: line).to_a }
                      .flatten
                      .map { |name| Blueprint.find_by type_id: name.type_id }
                      .uniq
    render :index
  end
end
