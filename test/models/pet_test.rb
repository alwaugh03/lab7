require "test_helper"

class PetTest < ActiveSupport::TestCase
  fixtures :pets, :owners

  def setup
    @owner = owners(:one)
  end

  def valid_pet
    Pet.new(
      name: "Firulais",
      species: "dog",
      breed: "Labrador",
      date_of_birth: 1.year.ago.to_date,
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
end