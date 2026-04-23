class PetsController < ApplicationController
  def index
  @pets = if params[:species].present?
            Pet.by_species(params[:species])
          else
            Pet.all
          end
  end

  def show
  @pet = Pet.find(params[:id])
  @upcoming_appointments = @pet.appointments.upcoming
  end
end