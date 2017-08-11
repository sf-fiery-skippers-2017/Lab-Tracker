class ObservationsController < ApplicationController

  def new
    @experiment = Experiment.find(params[:experiment_id])
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(observation_params)
    if @observation.save
      @experiment = @observation.experiment
      @proposal = @experiment.proposal
      # redirect_to "/proposals/#{@proposal.id}/experiments/#{@experiment.id}"
      redirect_to proposal_experiment_path(@proposal, @experiment)
    else
      render 'new'
    end
  end

  private
  def observation_params
    params.require(:observation).permit(:notes, :experiment_id, :observer_id)
  end
end
