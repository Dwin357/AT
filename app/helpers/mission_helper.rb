helpers do
  def mission_time
    Time.now.strftime("%H:%M")
  end

  def mission_date
    Time.now.strftime("%Y-%m-%d")
  end

  def stoplight_class(checked_in)
    checked_in ? 'text-success' : 'text-danger'
  end

  def display_toggle(on)
    on ?  "'visibility: hidden'": "'visibility: show'"
  end

end


# def leave_wire
#   !!!no method error, private method called for <model>!!!!
#   self.out_wire = true
#   self.save
#   # if this gets wrapped in a transaction, chng sv to !
# end
