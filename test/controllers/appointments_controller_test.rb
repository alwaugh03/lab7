require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  fixtures :appointments, :pets, :vets

  setup do
    @appointment = appointments(:one)
    @pet = pets(:one)
    @vet = vets(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should create appointment with valid params" do
    assert_difference("Appointment.count", 1) do
      post appointments_url, params: {
        appointment: {
          date: 1.day.from_now,
          reason: "Checkup",
          status: "scheduled",
          pet_id: @pet.id,
          vet_id: @vet.id
        }
      }
    end

    assert_redirected_to appointment_url(Appointment.last)
    assert_equal "Appointment was successfully created.", flash[:notice]
  end

  test "should not create appointment with invalid params" do
    assert_no_difference("Appointment.count") do
      post appointments_url, params: {
        appointment: {
          date: nil,
          reason: "",
          status: nil,
          pet_id: nil,
          vet_id: nil
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: {
      appointment: { reason: "Updated reason" }
    }

    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end
end