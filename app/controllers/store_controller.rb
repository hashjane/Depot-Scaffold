class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

include ActionView::Helpers::NumberHelper
  helper_method :number_to_nzd

  def increment_session_counter
    if session[:counter].nil?
      session[:counter] = 0
    end

    session[:counter] += 1;
  end


  def index
    @session_counter = increment_session_counter
    @products = Product.order(:title)
    @time = time_display
    @session_counter_message = "You have been here for #{@session_counter} times" if @session_counter > 5

  end

  def time_display
    time = Time.now
    time.to_formatted_s(:short)
  end

  def number_to_nzd(price)
    number_to_currency(price, unit: "NZD$", separator: ".", delimiter: "", format: "%u %n")
  end

end
