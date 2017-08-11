module ProceduresHelper
  def completeness(procedure)
    show_status = ""
    if procedure.is_completed == true
      show_status = "Complete"
    else
      show_status = "Incomplete"
    end
    return show_status
  end
end
