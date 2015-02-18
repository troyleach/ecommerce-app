class ProductsController < ApplicationController

  def index
    @products = Product.all
    @daily_deals = @products.sample(3)

    if params[:display] == "price"
      @products = @products.where("price < ?", 3000)
      @discount_display = "Todays Discounts"
    end

    if params[:price] == "order"
      @products = @products.order(:price => :asc)
      @discount_display = "Sorted lowest to highest"
    end

    if params[:category]
      @products = @products.where(:category => params[:category])
      @discount_display = "Category: #{params[:category].capitalize}"
    end

    if params[:search]
      @products = @products.where('title LIKE ?', "%#{params[:search]}%")
    end
    # @products = @products.where(:title => params[:search])
    # @products = @products.where('title LIKE ?', "%" + params[:search] + "%")
  end

  def new
  end

  def create
    Product.create({:price => params[:price], :title => params[:title], :image => params[:image], :description => params[:description], :category => params[:category], :brand => params[:brand]})
    @new_product = Product.last

    flash[:success] = "This Product added"
    redirect_to "/products/#{@new_product.id}"
    # could do this redirect_to "/products/params[:id]"
  end


  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find(params[:id])
    end
    @options = ProductOption.all
  end


  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    @product.update({:price => params[:price], :title => params[:title], :image => params[:image], :description => params[:description], :category => params[:category], :brand => params[:brand]})
  end
  

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:danger] = "Product Deleted"
    redirect_to '/'
  end

end
