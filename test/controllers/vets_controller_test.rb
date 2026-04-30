require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  fixtures :vets

  setup do
    @vet = vets(:one)
  end

  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should show vet" do
    get vet_url(@vet)
    assert_response :success
  end

  test "should create vet with valid params" do
    assert_difference("Vet.count", 1) do
      post vets_url, params: {
        vet: {
          first_name: "John",
          last_name: "Doe",
          email: "john#{SecureRandom.hex(4)}@test.com",
          specialization: "Surgery"
        }
      }
    end

    assert_redirected_to vet_url(Vet.last)
    assert_equal "Vet was successfully created.", flash[:notice]
  end

  test "should not create vet with invalid params" do
    assert_no_difference("Vet.count") do
      post vets_url, params: {
        vet: {
          first_name: "",
          last_name: "",
          email: "",
          specialization: ""
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update vet" do
    patch vet_url(@vet), params: {
      vet: { first_name: "Updated" }
    }

    assert_redirected_to vet_url(@vet)
  end

  test "should destroy vet" do
    assert_difference("Vet.count", -1) do
      delete vet_url(@vet)
    end

    assert_redirected_to vets_url
  end
end