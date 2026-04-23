require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @vet = Vet.create!(
      first_name: "Doc",
      last_name: "Smith",
      email: "doc@test.com",
      specialization: "general"
    )
  end

  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should get show" do
    get vet_url(@vet)
    assert_response :success
  end
end
