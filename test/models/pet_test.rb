require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(
      first_name: "Jane",
      last_name: "Doe",
      email: "jane@example.com",
      phone: "123"
    )
  end

  def valid_pet
    Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.today - 1.year,
      weight: 10,
      owner: @owner
    )
  end

  test "valid pet" do
    assert valid_pet.valid?
  end

  test "invalid without name" do
    pet = valid_pet
    pet.name = nil
    assert_not pet.valid?
  end

  test "invalid future birth date" do
    pet = valid_pet
    pet.date_of_birth = Date.today + 1
    assert_not pet.valid?
  end

  test "invalid weight" do
    pet = valid_pet
    pet.weight = 0
    assert_not pet.valid?
  end
end