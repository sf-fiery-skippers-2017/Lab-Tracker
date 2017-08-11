class ProceduresController < ApplicationController

  def index
    
  end

  def new
    @experiment = Experiment.find(params[:experiment_id])
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      @experiment = @procedure.experiment
      @proposal = @experiment.proposal
      redirect_to "/proposals/#{@proposal.id}/experiments/#{@experiment.id}"
    else
      render 'new'
    end
  end

  private
  def procedure_params
    params.require(:procedure).permit(:steps, :experiment_id)
  end
end
