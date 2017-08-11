class ProceduresController < ApplicationController
 before_action :set_procedures, only: [:show, :edit, :update, :destroy]
  def index
    @experiment = Experiment.find(params[:experiment_id])
    @procedures = @experiment.procedures
    @proposal = @experiment.proposal
  end

  def show
  end

  def new
    @experiment = Experiment.find(params[:experiment_id])
    @procedure = Procedure.new
  end


  def edit
  end

  def create
    @experiment = Experiment.find(params[:experiment_id])
    @procedure = @experiment.procedures.new(procedure_params)
    if @procedure.save
      redirect_to experiment_procedures_path(@experiment)

    else
      render 'new'
    end
  end
  
   def update
   end

  def destroy
  end

  private
  def procedure_params
    params.require(:procedure).permit(:steps, :experiment_id, :is_completed)
  end

 
  
  def set_procedures
    @procedure = Procedure.find(params[:id])
  end

  def procedure_params
    params.require(:procedure).permit(:steps)
  end

end
