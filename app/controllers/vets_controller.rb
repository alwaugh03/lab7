class VetsController < ApplicationController
  def index
    @vets = if params[:specialization].present?
            Vet.by_specialization(params[:specialization])
          else
            Vet.all
          end
  end

  def show
    @vet = Vet.find(params[:id])
    @past_appointments = @vet.appointments.past
  end
end