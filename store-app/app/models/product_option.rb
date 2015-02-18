class ProductOption < ActiveRecord::Base
  belongs_to  :product

  def find_option
    @options.where(:product_id => 9).pluck(:name)
  end

end
#I know that I hard coded the product_id SO question, can I have find_option(id)
# I am just trying to get this method to run

# @product_options = []
# @options.each do |options|
#   @product_options << options.name if options.product_id == id