require 'test_helper'

class RecuPassControllerTest < ActionDispatch::IntegrationTest
  test "should get recuperar" do
    get recu_pass_recuperar_url
    assert_response :success
  end

end
