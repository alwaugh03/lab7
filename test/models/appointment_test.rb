require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(first_name: "O", last_name: "W", email: "o@example.com", phone: "1")
    @pet = Pet.create!(name: "Firu", species: "dog", date_of_birth: Date.today - 1.year, weight: 5, owner: @owner)
    @vet = Vet.create!(first_name: "V", last_name: "E", email: "v@example.com", specialization: "gen")
  end

  def valid_appointment
    Appointment.new(
      date: Time.current + 1.day,
      reason: "Checkup",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
  end

  test "valid appointment" do
    assert valid_appointment.valid?
  end

  test "invalid without pet" do
    appt = valid_appointment
    appt.pet = nil
    assert_not appt.valid?
  end

  test "invalid without vet" do
    appt = valid_appointment
    appt.vet = nil
    assert_not appt.valid?
  end

  test "invalid without date" do
    appt = valid_appointment
    appt.date = nil
    assert_not appt.valid?
  end
end