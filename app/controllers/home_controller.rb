class HomeController < ApplicationController
  def index
    @customer_application = CustomerApplication.new
  end
end
