require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  fixtures :appointments, :pets, :vets, :owners

  def setup
    @pet = pets(:one)
    @vet = vets(:one)
  end

  def valid_appointment
    Appointment.new(
      date: 1.day.from_now,
      reason: "Checkup",
      status: "scheduled",
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