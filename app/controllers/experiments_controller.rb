class ExperimentsController < ApplicationController
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]

  def index
    @proposal = Proposal.find(params[:proposal_id])
    @experiments = @proposal.experiments
    @comments = @proposal.comments
  end

  def show

    @comments = @experiment.comments
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    if @experiment.save
      redirect_to proposal_experiment_path(@experiment)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @experiment.update(experiment_params)
    redirect_to proposal_experiments_path(@experiment.id)
  end

  def destroy
    @experiment.destroy
    redirect_to proposal_experiments_path(@experiment.id)
  end

  private
  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(:title, :results, :conclusion)
  end
end
