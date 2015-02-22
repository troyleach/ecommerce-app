class Product < ActiveRecord::Base
  belongs_to  :vendor
  has_many    :product_options
  has_many    :orders
  has_many    :images

  def discount_message
    if price < 2000
      "THIS PRODUCT IS ON SALE"
    else
      "THIS ITEM IS DISCOUNTED!"
    end
  end

  def daily_discount_message
    price - discount_computation
  end

  def discount_computation
    daily_deals_discount = price * 0.25
  end

  def tax_computation
    price * 0.09
  end

  def add_tax
    tax_computation + price
  end

end
