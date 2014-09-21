require 'test_helper'

class HtmlpagesControllerTest < ActionController::TestCase
  setup do
    @htmlpage = htmlpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:htmlpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create htmlpage" do
    assert_difference('Htmlpage.count') do
      post :create, htmlpage: { css: @htmlpage.css, html: @htmlpage.html, js: @htmlpage.js, library: @htmlpage.library }
    end

    assert_redirected_to htmlpage_path(assigns(:htmlpage))
  end

  test "should show htmlpage" do
    get :show, id: @htmlpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @htmlpage
    assert_response :success
  end

  test "should update htmlpage" do
    patch :update, id: @htmlpage, htmlpage: { css: @htmlpage.css, html: @htmlpage.html, js: @htmlpage.js, library: @htmlpage.library }
    assert_redirected_to htmlpage_path(assigns(:htmlpage))
  end

  test "should destroy htmlpage" do
    assert_difference('Htmlpage.count', -1) do
      delete :destroy, id: @htmlpage
    end

    assert_redirected_to htmlpages_path
  end
end
