class ExperimentsController < ApplicationController
   before_action :set_experiment, only: [:show, :edit, :update, :destroy]

  def index
    @proposal = Proposal.find(params[:proposal_id])
    @experiments = @proposal.experiments
    @comments = @proposal.comments
  end

  def show
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = @proposal.experiments.new(exp_params)
    @experiment.lab_staff_id = session[:user_id]
    if @experiment.save
      redirect_to proposal_experiment_path(@proposal, @experiment)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def exp_params
    params.require(:experiment).permit(:title)
  end
end
