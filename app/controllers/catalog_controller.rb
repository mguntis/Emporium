class CatalogController < ApplicationController
  before_filter :initialize_cart

  def index
    @page_title = "#{t(:book_list)}"
    @books = Book.paginate(:page => params[:page], :per_page => 10).order("books.id desc")
    @products = Product.paginate(:page => params[:page], :per_page => 10).order("products.id desc")
  end

  def show
    if @book
    @book = Book.find(params[:id]) rescue nil
    return render(:text => "#{t(:not_found)}", :status => 404) unless @book
    else
    @product = Product.find(params[:id]) rescue nil
    return render(:text => "#{t(:not_found)}", :status => 404) unless @product
    @page_title = @product.title
      end
  end


  def search
  end

  def latest
    @page_title = "#{t(:latest_books)}"
    @books = Book.latest
    @products = Product.latest
  end
end
