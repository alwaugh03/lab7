require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = Owner.create!(
      first_name: "John",
      last_name: "Doe",
      email: "john@test.com",
      phone: "123"
    )
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should get show" do
    get owner_url(@owner)
    assert_response :success
  end
end