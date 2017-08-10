class ObservationsController < ApplicationController

  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(observation_params)
    if @observation.save
      redirect_to proposal_experiment_path(@experiment)
    else
      render 'new'
    end
  end

  private
  def observation_params
    params.require(:observation).permit(:notes)
  end
end
