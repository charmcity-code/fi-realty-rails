class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render new_appointment_path
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:buyer_name, :listing_street, :date)
  end
end
