class StoreController < ApplicationController
  include ActionView::Helpers::NumberHelper
  helper_method :number_to_nzd

  def index
    @products = Product.order(:title)
    @time = time_display 
  end

  def time_display
    time = Time.now
    time.to_formatted_s(:short)
  end

  def number_to_nzd(price)
    number_to_currency(price, unit: "NZD$", separator: ".", delimiter: "", format: "%u %n")
  end

end
