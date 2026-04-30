require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  fixtures :treatments, :appointments

  def setup
    @appt = appointments(:one)
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