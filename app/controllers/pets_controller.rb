class PetsController < ApplicationController
  def index
    @pets = Pet.includes(:owner)
  end

  def show
  @pet = Pet.find(params[:id])
  @upcoming_appointments = @pet.appointments
                                  .includes(:vet)
                                  .upcoming
  end
end