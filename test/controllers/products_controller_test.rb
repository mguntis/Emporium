require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: {amount: @product.amount, category: @product.category, created_at: @product.created_at, description: @product.description, price: @product.price, seller_info: @product.seller_info, title: @product.title, types: @product.type, updated_at: @product.updated_at }
    end

    assert_redirected_to admin_product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: {amount: @product.amount, category: @product.category, created_at: @product.created_at, description: @product.description, price: @product.price, seller_info: @product.seller_info, title: @product.title, types: @product.type, updated_at: @product.updated_at }
    assert_redirected_to admin_product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to admin_products_path
  end
end
