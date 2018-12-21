class AppointmentsController < ApplicationController

  def new
    if params[:buyer_id] && !Buyer.exists?(params[:buyer_id])
      redirect_to buyers_path
    else
      @appointment = Appointment.new(buyer_id: params[:buyer_id])
    end
  end

  def create
    params[:appointment][:date] = Chronic.parse(params[:appointment][:date])
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      flash[:message] = "Oops! Something went wrong."
      redirect_to new_appointment_path
    end
  end

  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def index
    if params[:buyer_id]
      @appointments = Buyer.find(params[:buyer_id]).appointments.order('date ASC')
    else
      @appointments = Appointment.order('date ASC')
    end
  end

  def update
    params[:appointment][:date] = Chronic.parse(params[:appointment][:date])
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
    params.require(:appointment).permit(:buyer_name, :listing_street, :date, :buyer_id)
  end

end