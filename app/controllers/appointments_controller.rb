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

  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def index
    @appointments = Appointment.all
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to appointments_path
  end

   private

  def appointment_params
    params.require(:appointment).permit(:buyer_name, :listing_street, :date)
  end

end