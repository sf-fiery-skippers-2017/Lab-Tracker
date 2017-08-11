class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      redirect_to @proposal
    else
      render 'new'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    redirect_to controller: 'users', action: 'show', id: @proposal.pi_id
  end

  def edit

    @proposal = Proposal.find(params[:id])

  end

  def update

    @proposal = Proposal.find(params[:id])
    @user = @proposal.pi_id

    if @proposal.update(proposal_params)
      redirect_to controller: 'users', action: 'show', id: @proposal.pi_id
    else
      render :edit
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :summary, :hypothesis, :status, :pi_id)
  end
end
