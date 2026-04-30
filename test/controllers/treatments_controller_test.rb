require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  fixtures :treatments, :appointments

  setup do
    @appointment = appointments(:one)
    @treatment = treatments(:one)
  end

  test "should create treatment with valid params" do
    assert_difference("Treatment.count", 1) do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "Injection",
          medication: "Med",
          dosage: "10mg",
          notes: "Test",
          administered_at: Time.current
        }
      }
    end

    assert_redirected_to appointment_url(@appointment)
    assert_equal "Treatment was successfully created.", flash[:notice]
  end

  test "should not create treatment with invalid params" do
    assert_no_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "",
          administered_at: nil
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update treatment" do
    patch appointment_treatment_url(@appointment, @treatment), params: {
      treatment: { name: "Updated" }
    }

    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end

    assert_redirected_to appointment_url(@appointment)
  end
end