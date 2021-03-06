class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(24)
  end

  def men_products
    @men_products = Product.joins(:categories).where(categories: { name: "Men" }).page(params[:page]).per(24)
  end

  def women_products
    @women_products = Product.joins(:categories).where(categories: { name: "Women" }).page(params[:page]).per(24)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    keyword_search = "%#{params[:keywords]}%"
    brand_search = params[:select_brand]
    if brand_search == ""
      @result_products_count = Product.where("name LIKE ?", keyword_search)
      @result_products = Product.where("name LIKE ?", keyword_search).page(params[:page])
    else
      @result_products_count = Product.where("name LIKE ? AND brand_id = ?", keyword_search, brand_search)
      @result_products = Product.where("name LIKE ? AND brand_id = ?", keyword_search, brand_search).page(params[:page])
    end
  end

  def filter
    filter = params[:filter_product]
    if filter == "Sale Products"
      @filter_keyword = "Sale Products"
      @filter_products = Product.where("sale_price < price").page(params[:page]).per(24)
    elsif filter == "New Products"
      @filter_keyword = "New Products"
      @filter_products = Product.where("created_at >= ?", Time.zone.today - 3.days).page(params[:page]).per(24)
    else
      @filter_keyword = "All Products"
      @filter_products = Product.all.page(params[:page]).per(24)
    end
  end
end
