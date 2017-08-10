module ExperimentsHelper
  def all_procedures_completed?(experiment)
    experiment.procedures.each do |procedure|
     return false if procedure.is_completed == false
     true
    end
  end
end