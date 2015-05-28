helpers do
  def mission_time
    Time.now.strftime("%H:%M")
  end

  def mission_date
    Time.now.strftime("%Y-%m-%d")
  end

  def stoplight(boolean)
    if boolean
      "<span class='text-success'> "
    else
      "<span class='text-danger'> "
    end
  end

  def stoplight_class(checked_in)
    checked_in ? 'text-success' : 'text-danger'
  end

  def check_in_btn(boolean)
    if !boolean
      "<button type='submit' class='btn btn-default'> Check In</button>"
    end
  end
end


# def leave_wire
#   !!!no method error, private method called for <model>!!!!
#   self.out_wire = true
#   self.save
#   # if this gets wrapped in a transaction, chng sv to !
# end
