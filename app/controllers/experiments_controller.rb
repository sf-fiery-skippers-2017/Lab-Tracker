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
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = @proposal.experiments.new(experiment_params)
    @experiment.lab_staff_id = session[:user_id]
    p @experiment.errors
    p "********************"
    if @experiment.save
      redirect_to proposal_experiment_path(@proposal, @experiment)
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    @experiment.update(experiment_params)
    @proposal = @experiment.proposal
    redirect_to proposal_experiment_path(@proposal, @experiment)
  end

  def destroy
    @experiment.destroy
    redirect_to proposal_experiments_path(@experiment)
  end


  private
  def set_experiment
    @experiment = Experiment.find(params[:id])
  end


  def experiment_params
    params.require(:experiment).permit(:title)
  end

end
