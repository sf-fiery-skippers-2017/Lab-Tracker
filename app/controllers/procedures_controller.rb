class ProceduresController < ApplicationController

  def index
    
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to proposal_experiment_path(@experiment)
    else
      render 'new'
    end
  end

  private
  def procedure_params
    params.require(:procedure).permit()
  end
end
