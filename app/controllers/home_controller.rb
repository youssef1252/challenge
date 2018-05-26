class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :get_products]

  def index
  end
end
