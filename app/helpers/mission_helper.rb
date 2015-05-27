def mission_time
  Time.now.strftime("%H:%M")
end

def mission_date
  Time.now.strftime("%Y-%m-%d")
end


# no method error, private method called for <model>
# def leave_wire
#   self.out_wire = true
#   self.save
#   # if this gets wrapped in a transaction, chng sv to !
# end
