require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = Owner.create!(
      first_name: "Jane",
      last_name: "Doe",
      email: "jane@test.com",
      phone: "123"
    )

    @pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.today - 1.year,
      weight: 10,
      owner: @owner
    )
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get show" do
    get pet_url(@pet)
    assert_response :success
  end
end