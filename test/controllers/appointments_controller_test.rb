require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = Owner.create!(
      first_name: "John",
      last_name: "Doe",
      email: "john@test.com",
      phone: "123"
    )

    @pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.today - 1.year,
      weight: 10,
      owner: @owner
    )

    @vet = Vet.create!(
      first_name: "Doc",
      last_name: "Smith",
      email: "doc@test.com",
      specialization: "general"
    )

    @appointment = Appointment.create!(
      date: Time.current,
      reason: "Checkup",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get show" do
    get appointment_url(@appointment)
    assert_response :success
  end
end