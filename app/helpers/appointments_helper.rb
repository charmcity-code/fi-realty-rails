module AppointmentsHelper

  def buyer_id_field(appointment)
    if appointment.buyer.nil?
      select_tag "appointment[buyer_id]",
      content_tag(:option,'Select Buyer',:value=>"")+options_from_collection_for_select(Buyer.all, :id, :name)
    else
      hidden_field_tag "appointment[buyer_id]", appointment.buyer_id
    end
  end

  def parsed_date(appointment)
    appointment.date.strftime('%b %d, %Y')
  end

  def localtime(appointment)
    local_time(appointment.date, '%l:%M %p')
  end
end
