require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  def setup
    owner = Owner.create!(first_name: "O", last_name: "W", email: "ow@example.com", phone: "1")
    pet = Pet.create!(name: "Firu", species: "dog", date_of_birth: Date.today - 1.year, weight: 5, owner: owner)
    vet = Vet.create!(first_name: "V", last_name: "E", email: "ve@example.com", specialization: "gen")
    @appt = Appointment.create!(date: Time.current, reason: "x", status: :scheduled, pet: pet, vet: vet)
  end

  def valid_treatment
    Treatment.new(
      name: "Vaccine",
      administered_at: Time.current,
      appointment: @appt
    )
  end

  test "valid treatment" do
    assert valid_treatment.valid?
  end

  test "invalid without appointment" do
    t = valid_treatment
    t.appointment = nil
    assert_not t.valid?
  end

  test "invalid without name" do
    t = valid_treatment
    t.name = nil
    assert_not t.valid?
  end
end