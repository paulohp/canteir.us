require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get entrar" do
    get :entrar
    assert_response :success
  end

end
