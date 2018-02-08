class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = time_display 
  end

  def time_display
    time = Time.now
    time.to_formatted_s(:short)
  end

end
